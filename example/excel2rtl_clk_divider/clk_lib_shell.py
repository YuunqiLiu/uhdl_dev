# pylint: disable = unused-wildcard-import
from dsl import *
# pylint: enable = unused-wildcard-import

class clk_divider(Component):

    def __init__(self):
        super().__init__()
        self.clk_in = Input(UInt(1))
        self.clk_out = Output(UInt(1))


class clk_divider_1600_to_800(clk_divider):
    pass

class clk_divider_1600_to_400(clk_divider):
    pass

class clk_divider_1600_to_200(clk_divider):
    pass

class clk_divider_1600_to_100(clk_divider):
    pass

class clk_divider_1600_to_150(clk_divider):
    pass

class clk_divider_1600_to_20(clk_divider):
    pass

class clk_divider_1600_to_50(clk_divider):
    pass