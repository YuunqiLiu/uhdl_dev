from dsl import *

class CR(Port):

    def __init__(self):
        Port.__init__(self)
        self.new(clk=Wire(INPUT,1))
        self.new(rst=Wire(INPUT,1))