#!/usr/bin/env python3

# A chisel generator for hasti multi-layer interconnect
import json

# The template for the main file
tpl_file='''
package BusHarness

import Chisel._
import cde.{{Parameters, Field}}
import junctions._

class BusHarness extends Module {{
  implicit val p = Parameters.empty
  val io = new Bundle {{
{ports}
  }}

{funcs}

{insts}

{conns}

}}


class BusHarnessTests(c: BusHarness) extends Tester(c) {{
  step(1)
}}

object BusHarness {{
  def main(args: Array[String]): Unit = {{
    val tutArgs = args.slice(1, args.length)
    chiselMainTest(tutArgs, () => Module(new BusHarness())) {{
      c => new BusHarnessTests(c) }}
  }}
}}
'''
# smaller templates for code snippets (see string.format in Python doc if you are not familiar
# with the format)
tpl_ahb_master_connect = '    ahb_xbar.io.masters ({m_index}) <> io.{m_name}\n'
tpl_ahb_slave_connect =  '    io.{s_name} <> ahb_xbar.io.slaves({s_index})\n'
tpl_ahb_bridge_connect = '    {b_name}_inst.io.in <> ahb_xbar.io.slaves({b_index})\n'
tpl_bridge_apb_connect = '    {b_name}_inst.io.out <> {b_name}_apb_xbar.io.master\n'
tpl_apb_slave_connect =  '    io.{s_name} <> {b_name}_apb_xbar.io.slaves({s_index})\n'

tpl_decode_fns = '    val {fn_name} = (addr: UInt) => addr ({addr_msb},{addr_lsb}) === UInt ({addr_val})\n'
tpl_ahb_inst = '    val ahb_xbar = Module(new HastiXbar({nb_masters}, Seq({fn_list})))\n'
tpl_apb_inst = '    val {b_name}_apb_xbar = Module(new PociBus(Seq({fn_list})))\n'
tpl_bridge_inst = '    val {b_name}_inst = Module(new HastiToPociBridge())\n'

tpl_ahb_master_ports = '    val {m_name} = new HastiMasterIO().flip\n'
tpl_ahb_slave_ports  = '    val {s_name} = new HastiSlaveIO().flip\n'
tpl_apb_slave_ports  = '    val {s_name} = new PociIO()\n'
tpl_decode_funcs     = '    val {fn_name} = (addr: UInt) => addr ({addr_msb},{addr_lsb}) === UInt ({addr_val})\n'

def gen_ports(spec):
	txt = ''
	for m in spec['masters']:
		d = {'m_name': m}
		txt += tpl_ahb_master_ports.format(**d)
	for s,v in spec['slaves'].items():
		if 'bridge' in v and v['bridge']:
			for s in v['slaves'].keys():
				d = {'s_name': s}
				txt += tpl_apb_slave_ports.format(**d)
		else:
			d = {'s_name': s}
			txt += tpl_ahb_slave_ports.format(**d)
	return txt

def gen_funcs(spec):
	txt = ''
	for s,v in spec['slaves'].items():
		if 'bridge' in v and v['bridge']:
			d = {'fn_name' : s + '_afn',
				 'addr_msb': v['address_range'][0],
				 'addr_lsb': v['address_range'][1],
				 'addr_val': v['address_value']}
			txt += tpl_decode_funcs.format(**d)
			for ss,vv in v['slaves'].items():
				d = {'fn_name' : ss + '_afn',
					 'addr_msb': vv['address_range'][0],
					 'addr_lsb': vv['address_range'][1],
					 'addr_val': vv['address_value']}
				txt += tpl_decode_funcs.format(**d)
		else:
			d = {'fn_name' : s + '_afn',
				 'addr_msb': v['address_range'][0],
				 'addr_lsb': v['address_range'][1],
				 'addr_val': v['address_value']}
			txt += tpl_decode_funcs.format(**d)
	return txt

def gen_insts(spec):
	txt = ''
	d = {'nb_masters':len(spec['masters'])}
	d['fn_list']= ','.join([s+'_afn' for s in spec['slaves'].keys()])
	txt += tpl_ahb_inst.format(**d)
	for s,v in spec['slaves'].items():
		if 'bridge' in v and v['bridge']:
			d = {'b_name' : s}
			txt += tpl_bridge_inst.format(**d)
			d['fn_list']= ','.join([s+'_afn' for s in v['slaves'].keys()])
			txt += tpl_apb_inst.format(**d)
	return txt

def gen_connections(spec):
	txt = ''
	for i,m in enumerate(spec['masters']):
		d = {'m_index': i, 'm_name': m}
		txt += tpl_ahb_master_connect.format(**d)
	for i,s in enumerate(spec['slaves'].keys()):
		v = spec['slaves'][s]
		if 'bridge' in v and v['bridge']:
			# generate ahb->bridge->apb
			d = {'b_name': s, 'b_index': i}
			txt += tpl_ahb_bridge_connect.format(**d)
			txt += tpl_bridge_apb_connect.format(**d)
			# generate apb slaves
			for j,ss in enumerate(v['slaves'].keys()):
				d = {'s_name': ss, 'b_name': s,'s_index': j}
				txt += tpl_apb_slave_connect.format(**d)
		else:
			d = {'s_index': i,'s_name': s}
			txt += tpl_ahb_slave_connect.format(**d)
	return txt


def get_args():
	"""
	Get command line arguments
	"""
	import sys
	from optparse import OptionParser

	parser = OptionParser(usage='%prog -j config.json [-d outdir] [-V]')
	parser.set_description('AHB/APB bus complex generator')
	parser.add_option('-j','--json',dest='json',help='JSON configuration file')
	parser.add_option('-d','--outdir',dest='outdir',help='Directory where to store the chisel file')
	parser.add_option('-V','--version',dest='version',action='store_true',default=False,help='Display version')

	cmd_name = sys.argv[0]

	(options,args) = parser.parse_args()

	if 'version' in options.__dict__ and options.version:
		print('{} version 1.0'.format(sys.argv[0]))
	return options


if __name__ == '__main__':

	args = get_args()
	ml_ahb = None
	with open(args.json) as f:
		print("-I- Reading JSON file " + args.json)
		ml_ahb = json.load(f)

	d=dict()
	d['ports'] = gen_ports(ml_ahb)
	d['funcs'] = gen_funcs(ml_ahb)
	d['insts'] = gen_insts(ml_ahb)
	d['conns'] = gen_connections(ml_ahb)
	txt = tpl_file.format(**d)

	outfile_name = args.outdir + "/BusHarness.scala"
	with open(outfile_name,'w') as f:
		f.write(txt)
