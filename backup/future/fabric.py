from System import System
from Adapter import Slave
from Router import Router

#ddr subsys define
ddr0 = Slave()
ddr0.addr_range = (0,123)
ddr1 = Slave()
ddr1.addr_range = (123,143)
ddr2 = Slave()
ddr2.addr_range = (1255,146)

router=Router(master_num = 3,slave_num = 3)
router.data_width = 32
router.user_width = 3
#add node to ddr subsys
ddr_subsys = System()
ddr_subsys.add(ddr0)
ddr_subsys.add(ddr1)
ddr_subsys.add(ddr2)
ddr_subsys.add(router)
#ddr subsys inter link
ddr_subsys.link(   ddr0.port.s  ,   router.port.m0  )
ddr_subsys.link(   ddr1.port.s  ,   router.port.m1  )
ddr_subsys.link(   ddr2.port.s  ,   router.port.m2  )
#port to other subsys
ddr_subsys.out(out0=router.s0)
ddr_subsys.out(out1=router.s1)
ddr_subsys.out(out2=router.s2)
#check subsys define 
ddr_subsys.check()

#full chip define
full_chip = System()
full_chip.add(ddr_subsys)
full_chip.add(cpu_subsys)
full_chip.link(cpu_subsys.port.out0,ddr_subsys.port.out0)
full_chip.link(cpu_subsys.port.out1,ddr_subsys.port.out1)
full_chip.link(cpu_subsys.port.out2,ddr_subsys.port.out2)




print(ddr0.s[0])

print(p.s[0])
print(p.m[2])


#p.num = 3
#print(p.name)
print(p.name)

print(p.user_width)
print(p.data_width)