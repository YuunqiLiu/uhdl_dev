class AXI4Port(object):
    __slots__ = ('__user_width','__data_width','__id_width','__user_width','__is_master')

    def __init__(self):
        self.__user_width = None
        self.__data_width = None
        self.__id_width   = 9
        self.__user_width = None
        self.__is_master  = None

    @property
    def is_master(self):
        return self.__is_master
    @is_master.setter
    def is_master(self,is_master):
        self.__is_master = is_master

class PackPort(object):
    __slots__ = ('__data_width','__user_width','id_range_list','__is_master')
    
    def __init__(self):
        #self.user_width = None
        #self.__is_master      = None
        self.__data_width     = None 
        self.__user_width     = None

    #@property
    #def is_master(self):
    #    return self.__is_master
    #@is_master.setter
    #def is_master(self,is_master):
    #    self.__is_master = is_master

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

    def __str__(self):
        return "A PackPort belongs to %s" % 233


class PackPortMaster(PackPort):

    def __init__(self):
        PackPort.__init__(self)
        #self.id_range_list  = None  #用tuple形式表示一个ID段，list里面保存多个ID段

    @property
    def is_master(self):
        return True


class PackPortSlave(PackPort):

    def __init__(self):
        PackPort.__init__(self)
        self.id_range_list  = None  #用tuple形式表示一个ID段，list里面保存多个ID段

    @property
    def is_master(self):
        return False
