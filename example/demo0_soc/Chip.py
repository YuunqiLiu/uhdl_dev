from dsl import *

from AXI4PortNoUQR_A32_D64_I8_B4 import AXI4PortNoUQR_A32_D64_I8_B4
from CR             import CR
from ChipGPIO       import ChipGPIO

from CPUSubsys      import CPUSubsys
from GPUSubsys      import GPUSubsys
from AISubsys       import AISubsys
from VideoSubsys    import VideoSubsys
from DDRSubsys      import DDRSubsys
from PeriSubsys     import PeriSubsys
from HSPeriSubsys   import HSPeriSubsys

from AXICrossbar    import AXICrossbar

class Chip(Component):

    def __init__(self):
        Component.__init__(self,'Chip')
        self.new(gpio=ChipGPIO())

        self.new(inst_cpu_subsys    = CPUSubsys())
        self.new(inst_gpu_subsys    = GPUSubsys())
        self.new(inst_ai_subsys     = AISubsys())
        self.new(inst_vd0_subsys    = VideoSubsys())
        self.new(inst_vd1_subsys    = VideoSubsys())

        self.new(inst_ddr_subsys    = DDRSubsys())
        self.new(inst_peri_subsys   = PeriSubsys())
        self.new(inst_hsperi_subsys = HSPeriSubsys())

        self.new(inst_sys_crossbar  = AXICrossbar(INPUT_NUM=5,OUTPUT_NUM=3))

        self.link(self.inst_cpu_subsys.axi , self.inst_sys_crossbar.axii0)
        self.link(self.inst_gpu_subsys.axi , self.inst_sys_crossbar.axii1)
        self.link(self.inst_vd0_subsys.axi , self.inst_sys_crossbar.axii2)
        self.link(self.inst_vd1_subsys.axi , self.inst_sys_crossbar.axii3)
        self.link(self.inst_ai_subsys.axi  , self.inst_sys_crossbar.axii4)

        self.link(self.inst_ddr_subsys.axi    , self.inst_sys_crossbar.axio0)
        self.link(self.inst_peri_subsys.axi   , self.inst_sys_crossbar.axio1)
        self.link(self.inst_hsperi_subsys.axi , self.inst_sys_crossbar.axio2)
        
chip = Chip()
chip.output_path = './demo0_soc_out'
chip.generate()