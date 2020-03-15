from dsl import *
from CR import CR
from AXI4PortNoUQR_A32_D64_I8_B4 import AXI4PortNoUQR_A32_D64_I8_B4
from AXICrossbar import AXICrossbar

class AISRAM(Component):

    def __init__(self):
        Component.__init__(self,'AISRAM')
        self.new(acr=CR())
        self.new(axi=AXI4PortNoUQR_A32_D64_I8_B4().reverse())

class AICPU(Component):

    def __init__(self):
        Component.__init__(self,'AICPU')
        self.new(acr=CR())
        self.new(axi=AXI4PortNoUQR_A32_D64_I8_B4())

class AIDMA(Component):

    def __init__(self):
        Component.__init__(self,'AIDMA')
        self.new(acr=CR())
        self.new(axi=AXI4PortNoUQR_A32_D64_I8_B4())

class AIAccelerator(Component):

    def __init__(self):
        Component.__init__(self,'AIAccelerator')
        self.new(acr=CR())
        self.new(axi=AXI4PortNoUQR_A32_D64_I8_B4())

class AICrossbar(AXICrossbar):

    def __init__(self):
        # super(AICrossbar,self).__init__(INPUT_NUM=3,OUTPUT_NUM=3)
        AXICrossbar.__init__(self,INPUT_NUM=3,OUTPUT_NUM=3)
        self.module_name = 'AICrossbar'

class AISubsys(Component):

    def __init__(self):
        Component.__init__(self,'AISubsys')
        self.new(acr=CR())
        self.new(axi=AXI4PortNoUQR_A32_D64_I8_B4())

        self.new(inst_ai_sram0    = AISRAM())
        self.new(inst_ai_sram1    = AISRAM())
        self.new(inst_ai_cpu    = AICPU())
        self.new(inst_ai_dma    = AIDMA())
        self.new(inst_ai_accelerator    = AIAccelerator())

        self.new(inst_ai_corssbar = AICrossbar())

        self.link(self.axi, self.inst_ai_corssbar.axio0)
        self.link(self.inst_ai_sram0.axi, self.inst_ai_corssbar.axio1)
        self.link(self.inst_ai_sram1.axi, self.inst_ai_corssbar.axio2)

        self.link(self.inst_ai_cpu.axi, self.inst_ai_corssbar.axii0)
        self.link(self.inst_ai_dma.axi, self.inst_ai_corssbar.axii1)
        self.link(self.inst_ai_accelerator.axi, self.inst_ai_corssbar.axii2)