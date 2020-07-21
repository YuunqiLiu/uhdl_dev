from .Root import Root
#from .Entity import Entity

class Virtual(Root):

    def __init__(self):
        Root.__init__(self)
        self.set_name(None)
        self.constraint_father_type(Virtual,Entity)

    def set_father(self,son):
        ''' 对于virtual类型而言,它是为了便于操作而存在于数据结构中的，在实际的逻辑关系中不应该存在
            因此在为加入它的对象定义一个"father"时，它会略过自己，以自己的father的set_father方法
            来定义son的fahter'''
        self.father.set_father(son)
