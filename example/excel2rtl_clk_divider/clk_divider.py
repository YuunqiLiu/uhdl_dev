import os,sys
import openpyxl

current_path = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_path)

# pylint: disable =unused-wildcard-import
from dsl            import *
from clk_lib_shell  import *
# pylint: enable  =unused-wildcard-import

class Clock():

    def __init__(self,name,freq,source):
        super().__init__()
        self.name = name
        self.freq = freq
        self.source = source

class ClockIn(Clock):
    pass

class ClockOut(Clock):
    pass

class ClockDivider(Component):

    def __init__(self):
        super().__init__()
        self.clk_in_dict  = {}
        self.clk_out_dict = {}
        self.read_config()
        self.gen_circuit()

    def read_config(self):
        worksheet = openpyxl.load_workbook(os.path.join(current_path,'clk_config.xlsx'),read_only=True)['Sheet1']
        for row in list(worksheet)[1:]:
            if row[1].value == 'Input':
                self.clk_in_dict[row[0].value] = ClockIn(name=row[0].value,freq=row[3].value,source=row[2].value)
            elif row[1].value == 'Output':
                self.clk_out_dict[row[0].value] =ClockOut(name=row[0].value,freq=row[3].value,source=row[2].value)  
            else:
                raise Exception()

    def gen_circuit(self):
        for c in self.clk_in_dict.values():
            setattr(self,c.name,Input(UInt(1)))
        
        for c in self.clk_out_dict.values():
            setattr(self,c.name,Output(UInt(1)))
            setattr(self,'clk_divider_%s_to_%s' %(c.source,c.name),eval('clk_divider_%s_to_%s()' % (self.clk_in_dict[c.source].freq,c.freq) )) 
            
            assign(getattr(self,c.name),getattr(self,'clk_divider_%s_to_%s' %(c.source,c.name)).clk_out)
            assign(getattr(self,'clk_divider_%s_to_%s' %(c.source,c.name)).clk_in,getattr(self,self.clk_in_dict[c.source].name))
            

a = ClockDivider()
a.output_path = os.path.join(current_path,'vsrc')
a.generate_verilog(iteration=True)