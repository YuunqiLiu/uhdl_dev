import os,sys
import unittest

from dsl import *

class TestComponent(unittest.TestCase):

    def test_define(self):
        c = Component('com')
        port = Port()
        port.new(clk=Wire(INPUT,1))
        port.new(rst=Wire(INPUT,1))
        c.new(cr=port)
        self.assertIsInstance(c,Component)
    