
from pysrc.uhdl.Demo.lwnoc import *


slv1 = Slave()
slv2 = Slave()
mst1 = Master()
mst2 = Master()
arb  = Arbiter()
dec  = Decoder()

N = Network()
N.add(slv1)
N.add(slv2)
N.add(mst1)
N.add(mst2)
N.add(arb)
N.add(dec)
N.link(slv1, arb)
N.link(slv2, arb)
N.link(arb, dec)
N.link(dec, mst1)
N.link(dec, mst2)
N._id_propagation()
        
dwrap = DWrap(N)
dwrap.generate_verilog()
N._show()