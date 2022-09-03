from pysrc.uhdl.Demo.lwnoc import *


slv1 = SlaveAxi()
slv2 = SlaveAxi()

arb1 = ArbiterDual()

dec1 = DecoderDual()

mst1 = MasterAxi()
mst1.address_range_list = [(0x0000,0xffff)]
mst2 = MasterAxi()
mst2.address_range_list = [(0x10000,0x1ffff)]


N = Network()
N.add(slv1)
N.add(slv2)
N.add(arb1)
N.add(dec1)
N.add(mst1)
N.add(mst2)

N.link(slv1, arb1)
N.link(slv2, arb1)
N.link(arb1, dec1)
N.link(dec1, mst1)
N.link(dec1, mst2)

N._generate_system_address_mapping()
N._src_id_propagation()
N._tgt_id_propagation()
N._generate_local_port_id_mapping()

slv1.create_vinst().generate_verilog()
mst1.create_vinst().generate_verilog()