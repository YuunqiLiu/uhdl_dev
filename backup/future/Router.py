
from Component import Component
from Port import PackPortSlave
from Port import PackPortMaster
from InterPortContainer import InterPortContainer

class Router(Component):
    __slots__ = ('__name','__data_width','__user_width','__slave_port','__master_port','__port')

    def __init__(self,master_num,slave_num):
        #(filename,line_number,function_name,text)=traceback.extract_stack()[-2]
        #self.__name = text[:text.find('=')].strip()
        self.__user_width   = None
        self.__data_width   = None
        self.__port         = InterPortContainer()
        
        for i in range(slave_num):
            self.__port.add(PackPortSlave(),"s%s" %i)
        for i in range(master_num):
            self.__port.add(PackPortMaster(),"m%s" %i)

    @property
    def port(self):
        return self.__port


        #self.__slave_port   = [PackPortSlave() for i in range(slave_num)]
        #self.__master_port  = [PackPortMaster() for i in range(master_num)]
        #self.__master_num = None
        #self.__slave_num  = None
        #self.age=None



    @property
    def data_width(self):
        return self.__data_width
    @data_width.setter
    def data_width(self,data_width):
        if not (data_width > 0 and data_width <= 1024):
            raise Exception('data width should >0 and <=1024')    
        if data_width % 8 !=0:
            raise Exception('data width should be 8/16/32')
        self.__data_width = data_width

        for port in self.__slave_port:
            port.data_width = data_width
        for port in self.__master_port:
            port.data_width = data_width


    @property
    def user_width(self):
        return self.__user_width
    @user_width.setter
    def user_width(self,user_width):
        if not (user_width > 0 and user_width <= 64):
            raise Exception('addr width should >0 and <=64')    
        self.__user_width = user_width

        for port in self.__slave_port:
            port.user_width = user_width
        for port in self.__master_port:
            port.user_width = user_width

    @property
    def s(self):
        return self.__slave_port
    
    @property
    def m(self):
        return self.__master_port