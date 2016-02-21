package Ahbmli

import Chisel._

import cde.{Parameters, Field}
import junctions._


class Ahbmli(topParams: Parameters)  extends Module {
  implicit val p = topParams
  val io = new Bundle {
    val jtag = new HastiMasterIO().flip
    val imem = new HastiMasterIO().flip
    val dmem = new HastiMasterIO().flip

    val datamem = new HastiSlaveIO().flip
    val codemem = new HastiSlaveIO().flip

  }




  val xbar = Module(new HastiXbar(3, Seq(datamem_afn, codemem_afn)))
  val datamem_afn = (addr: UInt) => addr(31,28) === UInt(0)
  val codemem_afn = (addr: UInt) => addr(31, 28) === UInt(2)

  xbar.io.masters(0) <> io.jtag
  xbar.io.masters(1) <> io.dmem
  xbar.io.masters(2) <> io.imem

  io.codemem <> xbar.io.slaves(0)
  io.datamem <> xbar.io.slaves(1)


}




//class Ahbmli extends Module {
//  val io = new Bundle {
//    val out = UInt(OUTPUT, 8)
//  }
//  io.out := UInt(42)
//}

class AhbmliTests(c: Ahbmli) extends Tester(c) {
  step(1)
  // expect(c.io.out, 42)
}

object Ahbmli {
  def main(args: Array[String]): Unit = {
    val tutArgs = args.slice(1, args.length)
    chiselMainTest(tutArgs, () => Module(new Ahbmli())) {
      c => new AhbmliTests(c) }
  }
}
