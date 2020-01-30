import traceback
from abc import abstractmethod

class Root(object):

    def __init__(self):
        self.__name        = None
        self.__father_type = None               #保留father type为空，子类不修改father_type就会出错

    @property
    def name(self):
        return self.__name

    @property
    def father(self):
        return self.__father

    def set_name(self,name):
        self.__name = name

    @father.setter
    def father(self,father):
        ''' 获取father的时候应当检查father的类型是否正确，对于Root而言
            father必须是Root类型'''
        if not isinstance(father,self.__father_type):
            raise TypeError("The father set is a %s,expect a %s." %(type(father),self.__father_type))
        self.__father = father

    @abstractmethod
    def set_father(self,son):
        ''' 这个方法用来指明传入的son对象它的"fahter"是哪个对象，通过定义这个方法
            可以让对象能够逆向地索引数据结构，并且通过对这个方法的某些定义方式，来
            跨越实际的数据结构，重新定义一个抽象的结构关系'''
        pass
 
    def constraint_father_type(self,*T):
        ''' 这个方法设置了本对象应当指向的father对象的类型,默认的father对象的类型
            为None'''
        self.__father_type = T

    #=============================================================================================
    # father get
    #=============================================================================================

    def father_until(self,T):
        if isinstance(self,T):
            return self
        elif self.father is None:
            return self
        else:
            return self.father.father_until(T)

    def father_until_not(self,T):
        if not isinstance(self,T):
            return self
        elif self.father is None:
            return self
        else:
            return self.father.father_until_not(T)        

    #=============================================================================================
    # name get
    #=============================================================================================

    def join_name(self,*args):
        return '_'.join(args)

    def full_name(self):
        if self.father is None:
            return ''
        else:
            return self.join_name(self.father.full_name,self.name)

    def name_until(self,T):
        if isinstance(self,T):
            return self.name
        elif self.father is None:
            return ''
        else:
            return self.join_name(self.father.name_until(T),self.name)

    def name_before(self,T):
        if isinstance(self.father,T):
            return self.name
        elif self.father is None:
            return ''
        else:
            return self.join_name(self.father.name_before(T),self.name)

    def name_until_not(self,T):
        if not isinstance(self,T):
            return self.name
        elif self.father is None:
            return self.name
        else:
            return self.join_name(self.father.name_until_not(T),self.name)

    def name_before_not(self,T):
        if self.father is None:
            return self.name
        elif not isinstance(self.father,T):
            return self.name
        else:
            return self.join_name(self.father.name_before_not(T),self.name)






        
    #def __get_name(self):
    #    pass

    #def __not_define(self):
    #    raise Exception

    #@property
    #def full_name(self):
    #    return self.name_join(self.get_father_full_name(),self.name)
#
#
#
    #def name_join(self,*args):
    #    return '_'.join(args)


