from dsl import *

class ChipGPIO(Port):

    def __init__(self):
        Port.__init__(self)
        self.new(gpio0 = Wire(INPUT,1))
        self.new(gpio1 = Wire(INPUT,1))