from dsl import *
from CR import CR
from AXI4PortNoUQR_A32_D64_I8_B4 import AXI4PortNoUQR_A32_D64_I8_B4

class DDRSubsys(Component):

    def __init__(self):
        Component.__init__(self,'DDRSubsys')
        self.new(acr=CR())
        self.new(axi=AXI4PortNoUQR_A32_D64_I8_B4().reverse())