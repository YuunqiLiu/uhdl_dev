from operator import concat
from functools import reduce

from .Virtual import Virtual
from .Entity import Entity

class Container(Virtual):

    def __init__(self,ava_type):
        Virtual.__init__(self)
        self.constraint_father_type(Entity) #Container用于向Entity提供一个容器，用于装载允许类型的对象，且它不允许嵌套，因此它的fahter只能是Entity
        self.__ava_type = ava_type
        self.__payload  = {}
        self.__list     = []

    def __call__(self):
        return self.__payload.values()
    
    @property
    def as_list(self):
        return self.__list

    def sort(self):
        self.__list.sort()

    def new(self,**args):
        ''' 这个方法将传入容器的数据进行检查和保存。传入的数据为动态参数，其值必须是符合本容器要求的对象。
            这个方法会以变量名作为属性名，值作为属性值，动态地创建一个属性。
            这个方法还包含一个用于遍历这些属性的字典，并将以传入的动态参数的变量名作为key,值作为value,存入该字典。'''
        for name,item in args.items():
            if not isinstance(item,self.__ava_type):
                raise TypeError("The item in is a %s,expect a %s." %(type(item),self.__ava_type))
            elif hasattr(self,name):
                raise NameError("The name '%s' has used in this %s container." % (name,self.__ava_type))
            else:
                setattr(self,name,item)
                self.set_father(item)
                item.set_name(name)
                self.__payload[name] = item
                self.__list.append(item)



class PortContainer(Container):

    def __init__(self,ava_type):
        Container.__init__(self,ava_type)

    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    def gen_rtl_inst(self):
        '''生成RTL实例化'''
        return reduce(concat,[p.gen_rtl_inst() for p in self.as_list],[])
        #return [] if self.as_list is None else reduce(concat,[p.gen_rtl_inst() for p in self.as_list])

    def gen_rtl_def(self):
        '''生成RTL定义'''
        return reduce(concat,[p.gen_rtl_def() for p in self.as_list],[])
        #return [] if self.as_list is None else reduce(concat,[p.gen_rtl_def() for p in self.as_list])

    def gen_rtl_io(self):
        '''生成IO声明的RTL'''
        return reduce(concat,[p.gen_rtl_io() for p in self.as_list],[])
        #return [] if self.as_list is None else reduce(concat,[p.gen_rtl_io() for p in self.as_list])


class ComponentContainer(Container):

    def __init__(self,ava_type):
        Container.__init__(self,ava_type)

    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    def gen_vfile(self,path='./',recursion=True):
        return [p.gen_vfile(path=path,recursion=recursion) for p in self.as_list] #if self.as_list else []
        #return reduce(concat,[p.gen_vfile() for p in self.as_list],[])

    def gen_rtl_inst(self):
        return reduce(concat,[p.gen_rtl_inst()+[''] for p in self.as_list],[])
        #return [] if self.as_list is [] else reduce(concat,[p.gen_rtl_inst()+[''] for p in self.as_list])

    def gen_rtl_io(self):
        return reduce(concat,[p.gen_rtl_io() for p in self.as_list],[])
        #print(self.as_list)
        #print(not self.as_list)
        #return [] if not self.as_list else reduce(concat,[p.gen_rtl_io() for p in self.as_list])
        
 
