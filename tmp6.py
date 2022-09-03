from pysrc.uhdl.Demo.lwnoc import *



slv1 = SlaveAxi()
slv2 = SlaveAxi()

arb1 = Arbiter()

dec1 = Decoder()

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

N._collect_global_address_range_dict()
N._map_address_range_to_global_id()
N._master_id_propagation()
N._slave_id_propagation()
#print(N._global_address_range_id_map_dict.items())
N._report()

dec1.create_vinst().generate_verilog()
arb1.create_vinst().generate_verilog()