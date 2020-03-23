from .Root import Root

class Entity(Root):

    def __init__(self):
        Root.__init__(self)
        self.constraint_father_type(Entity)#Entity的father类型必须是Entity
        self.set_name("NULL")

    def set_father(self,father):
        ''' 对于一个Entity而言，对加入它的对象son而言，father就是它自身'''
        self.father = father
        #son.father = self


