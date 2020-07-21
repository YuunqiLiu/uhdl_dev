from Port import Port

class InterPortContainer(object):

    def __init__(self):
        pass

    def add(self,**args):
        for name,item in args.items():
            if not isinstance(item,Port):
                raise TypeError("The port in is not a Port,expect a Port.")
            elif hasattr(self,name):
                raise NameError("The name has used in this Port container.")
            else:
                setattr(self,name,item)
    #f = getattr(test_mod, 'hi')  #获去test_mod模块中名字叫“hi”的方法并赋值给f
    #f() #执行获取的方法

    #setattr(test_mod,'name','wdc')  #为方法添加名字为“name”的属性，并赋值为“wdc”
    #print(test_mod.name)    #打印输出为模块添加的属性