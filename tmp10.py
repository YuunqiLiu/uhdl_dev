from pysrc.uhdl import *



class VCompWrapper(Component):


    def __init__(self):
        super().__init__()
        self.vcomp = VComponent('test.sv','test')
        self.vcomp.LOGIC = Parameter(AnyConstant('usr_type'))
        self.expose_io(self.vcomp.get_io(''))



wrap = VCompWrapper()
wrap.generate_verilog(iteration=True)