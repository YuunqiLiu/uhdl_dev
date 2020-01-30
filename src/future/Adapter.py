from Port import PackPortSlave
from Port import AXI4Port

class Adapter(object):
    __slots__ = ('__user_width','__data_width','__user_width','__map_tuple_list')

    def __init__(self):
        #self.__user_width = None
        #self.__data_width = None
        #self.__user_width = None
        #self.__id_width   = None

        self.__map_tuple_list   = None #maplist指的是 addr->id的映射关系，这里addr又是一个range,所以一个映射用一个tuple表示，格式为(start_addr,end_addr,id)


    @property
    def data_width(self):
        return self.__data_width
    @data_width.setter
    def data_width(self,data_width):
        self.__data_width = data_width

    @property
    def user_width(self):
        return self.__user_width
    @user_width.setter
    def user_width(self,user_width):
        self.__user_width = user_width







class Slave(Adapter):

    __slots__ = ('__addr_range','__slave_port','__master_port')

    def __init__(self):
        self.__addr_range  = None
        self.__slave_port  = [PackPortSlave()]
        self.__master_port = [AXI4Port()]

    @property
    def addr_range(self):
        return self.__addr_range
    @addr_range.setter
    def addr_range(self,addr_range):
        self.__addr_range = addr_range

    @property
    def s(self):
        return self.__slave_port
    
    @property
    def m(self):
        return self.__master_port

