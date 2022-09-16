from pysrc.uhdl.Demo.lwnoc import *

N = Network()

slv1 = SlaveAxi()
N.add(slv1)

slv2 = SlaveAxi()
N.add(slv2)

arb1 = ArbiterDual(slv1.w_req_pld_width, slv1.r_req_pld_width, slv1.w_ack_pld_width, slv1.r_ack_pld_width)

dec1 = DecoderDual(slv1.w_req_pld_width, slv1.r_req_pld_width, slv1.w_ack_pld_width, slv1.r_ack_pld_width)

mst1 = MasterAxi()
mst1.address_range_list = [(0x0000,0xffff)]
mst2 = MasterAxi()
mst2.address_range_list = [(0x10000,0x1ffff)]


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
arb1.create_vinst().generate_verilog()
dec1.create_vinst().generate_verilog()

dwrap = DWrap(N)

dwrap.generate_verilog(iteration=True)
dwrap.generate_filelist()
dwrap.run_lint()