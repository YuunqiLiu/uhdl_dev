from dsl import *
from CR import CR
from AXI4PortNoUQR_A32_D64_I8_B4 import AXI4PortNoUQR_A32_D64_I8_B4

class AXICrossbar(Component):

    def __init__(self,INPUT_NUM=2,OUTPUT_NUM=2):
        Component.__init__(self,'AXICrossbar')
        self.INPUT_NUM  = INPUT_NUM
        self.OUTPUT_NUM = OUTPUT_NUM

        self.new(acr=CR())

        for i in range(0,self.INPUT_NUM):
            #self.new(axio=AXI4PortNoUQR_A32_D64_I8_B4())
            self.new(**{'axii%s' % i:AXI4PortNoUQR_A32_D64_I8_B4().reverse()})
        for i in range(0,self.OUTPUT_NUM):
            #self.new(axii=AXI4PortNoUQR_A32_D64_I8_B4().reverse())
            self.new(**{'axio%s' % i:AXI4PortNoUQR_A32_D64_I8_B4()})