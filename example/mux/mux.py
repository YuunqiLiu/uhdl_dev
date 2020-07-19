import os,sys

current_path = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_path)

# pylint: disable =unused-wildcard-import
from dsl            import *
# pylint: enable  =unused-wildcard-import


class Mux(Component):

    def __init__(self):
        super().__init__()
        self.op1 = Input(UInt(31)) # define op1 as input [30:0] 
        self.op2 = Input(UInt(31))
        self.aclk = Input(UInt(1))
        self.arst = Input(UInt(1))
        self.res = Output(UInt(31)) # define res as output [31:0]

        self.sel = Wire(UInt(1))
        self.internal_reg = Reg(UInt(31),self.aclk,self.arst)
        
        self.sel += Equal(self.op1,self.op2)
        tmp = when(self.sel).then(
            when(self.sel).then(self.op1).otherwise(self.op2)
        )
        self.internal_reg += tmp.when(self.sel).then(self.op1)
        self.res +=  self.internal_reg#use += to assign circuit

a = Mux()
a.output_path = os.path.join(current_path,'vsrc')
a.generate_verilog(iteration=True)