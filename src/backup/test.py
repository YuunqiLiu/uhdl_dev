
from Component import Component
from Port import Port

class Router2x2(Component):

    def __init__(self):
        Component.__init__(self)
        self.port.new(s0=Port())
        self.port.new(s1=Port())
        self.port.new(m0=Port())
        self.port.new(m1=Port())



top = Component()
top.new(r0=Router2x2())
top.new(r1=Router2x2())





from Component import Component
from Port      import Port

class PortAXI4(Port):

    def __init__(self):
        self.new(Wire("awvalid",Output,1))
        self.new(Wire("awready",Input,1))


class X2X(Component):

    def __init__(self,port_type):
        Component.__init__(self)
        self.new(m=port_type())
        self.new(s=port_type().inverse())
        self.VImpPort(self.m)
        self.VImpPort(self.s)

    def VImplement(self):
        #X2X Coretools script
        pass

class AXI_FAB(Component):

    def __init__(self,port_type,master_num,slave_num):
        Component.__init__(self)
        for i in range(master_num):
            eval("self.new(m%d=port_type())" %i)
            eval("self.VImpPort(self.m%d)"   %i)
        for i in range(master_num):
            eval("self.new(s%d=port_type())" %i)
            eval("self.VImpPort(self.s%d)"   %i)

    def VImplement(self):
        #AXI_FAB Coretools srcipt 
        pass

class AXI_FAB_2x2(Component):

    def __init__(self):
        Component.__init__(self)
        self.new(m1=PortAXI4())
        self.new(m2=PortAXI4())
        self.new(s1=PortAXI4())
        self.new(s2=PortAXI4())

        self.VImpPort(self.m1)
        self.VImpPort(self.m2)
        self.VImpPort(self.s1)
        self.VImpPort(self.s2)

    def VImplement(self):
        #user define 
        #this method can use all param in this object
        pass

class SubSys1(Component):

    def __init__(self):
        Component.__init__(self)
        self.new(m1 = PortAXI4())
        self.new(m2 = PortAXI4())
        self.new(s1 = PortAXI4())
        self.new(s2 = PortAXI4())
        self.new(fab1 = AXI_FAB_2x2())
        self.new(fab2 = AXI_FAB_2x2())
        self.fab1.bi_direction = True
        self.fab2.bi_direction = True
        self.link(self.m1,fab2.s1)
        self.link(self.m2,fab2.s2)
        self.link(self.s1,fab1.m1)
        self.link(self.s2,fab1.m2)
        self.link(fab1.s1,fab2.m1)
        self.link(fab2.s2,fab2.m2)

from Component import Component
from AXI_FAB import AXI_FAB
from X2X import X2X
from Master import Master
from Slave import Slave
from PortAXI4 import PortAXI4



def subsysA(Component):

    def __init__(self):
        Component.__init__(self)
        #Users can use any dynamic feature here
        self.new(fab1=AXI_FAB(PortAXI4,1,2))
        self.new(x2x1=X2X(PortAXI4))
        self.new(x2x2=X2X(PortAXI4))
        self.link(....)
        ...
        ..

def subsysB(Component):

    def ....

def Interconnect(Component):

    def __init__(self):
        Component.__init__(self)
        #Any method and property missing will be given user feedback by python's traceback
        self.new(subsysA())
        self.new(subsysB())
        self.link(....)
        ...

interconnect = Interconnect()
interconnect.generate()

