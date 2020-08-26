
package BusGen

import Chisel._
import cde.{Parameters, Field}
import junctions._

class BusGen extends Module {
  implicit val p = Parameters.empty
  val io = new Bundle {
    val jtag = new HastiMasterIO().flip
    val dmem = new HastiMasterIO().flip
    val imem = new HastiMasterIO().flip
    val uart = new PociIO()
    val spi = new PociIO()
    val i2c = new PociIO()
    val datamem = new HastiSlaveIO().flip
    val codemem = new HastiSlaveIO().flip

  }

    val bridge0_afn = (addr: UInt) => addr (31,28) === UInt (3)
    val uart_afn = (addr: UInt) => addr (27,24) === UInt (2)
    val spi_afn = (addr: UInt) => addr (27,24) === UInt (1)
    val i2c_afn = (addr: UInt) => addr (27,24) === UInt (0)
    val datamem_afn = (addr: UInt) => addr (31,28) === UInt (2)
    val codemem_afn = (addr: UInt) => addr (31,28) === UInt (0)


    val ahb_xbar = Module(new HastiXbar(3, Seq(bridge0_afn,datamem_afn,codemem_afn)))
    val bridge0_inst = Module(new HastiToPociBridge())
    val bridge0_apb_xbar = Module(new PociBus(Seq(uart_afn,spi_afn,i2c_afn)))


    ahb_xbar.io.masters (0) <> io.jtag
    ahb_xbar.io.masters (1) <> io.dmem
    ahb_xbar.io.masters (2) <> io.imem
    bridge0_inst.io.in <> ahb_xbar.io.slaves(0)
    bridge0_inst.io.out <> bridge0_apb_xbar.io.master
    io.uart <> bridge0_apb_xbar.io.slaves(0)
    io.spi <> bridge0_apb_xbar.io.slaves(1)
    io.i2c <> bridge0_apb_xbar.io.slaves(2)
    io.datamem <> ahb_xbar.io.slaves(1)
    io.codemem <> ahb_xbar.io.slaves(2)


}


class BusGenTests(c: BusGen) extends Tester(c) {
  step(1)
}

object BusGen {
  def main(args: Array[String]): Unit = {
    val tutArgs = args.slice(1, args.length)
    chiselMainTest(tutArgs, () => Module(new BusGen())) {
      c => new BusGenTests(c) }
  }
}
