from pysrc.uhdl.Demo.lwnoc import *

slv1 = Slave()
slv2 = Slave()
slv3 = Slave()

arb1 = Arbiter()
arb2 = Arbiter()
arb3 = Arbiter()

dec1 = Decoder()
dec2 = Decoder()

mst1 = Master()
mst1.global_id_list = [1, 2, 3]
mst2 = Master()
mst2.global_id_list = [4, 5, 6]
mst3 = Master()
mst3.global_id_list = [7, 8, 9]

N = Network()
N.add(slv1)
N.add(slv2)
N.add(slv3)
N.add(arb1)
N.add(dec1)
N.add(dec2)
N.add(mst1)
N.add(mst2)
N.add(arb2)
N.add(arb3)

N.link(slv2, arb1)
N.link(slv3, arb1)
N.link(arb1, dec1)
N.link(slv1, dec2)
N.link(dec1, arb2)
N.link(dec1, arb3)
N.link(dec2, arb2)
N.link(dec2, arb3)
N.link(arb2, mst1)
N.link(arb3, mst2)

N._id_propagation()
dwrap = DWrap(N)
dwrap.generate_verilog(iteration=True)
N._show()