from Component import Component
from Port import PackPort

class System(object):

    def __init__(self):
        self.__son_component = []
        self.__out_port      = []

    def add(self,component):


        pass


    def link(self,porta,portb):
        if not isinstance(porta,PackPort):
            raise TypeError("The first port in is not a PackPort,expect a PackPort.")
        if not isinstance(portb,PackPort):
            raise TypeError("The second port in is not a PackPort,expect a PackPort.")
        if porta.is_master and portb.is_master:
            raise TypeError("Both port are master port,expect a master and a slave.")
        elif not porta.is_master and not portb.is_master:
            raise TypeError("Both port are slave port,expect a master and a slave")
        elif porta.is_master:
            portm = porta
            ports = portb
        else:
            portm = portb
            ports = porta
    


    def out(self):
        pass
