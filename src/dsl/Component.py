import os,shutil

from .LinkManager   import LinkManager
from .Entity        import Entity
from .Container     import Container,PortContainer,ComponentContainer
from .Port          import Port

class Component(Entity):

    def __init__(self,module_name):
        Entity.__init__(self)
        self.module_name = module_name 
        self.constraint_father_type(Component)
        self.__port = PortContainer(Port)
        self.__com  = ComponentContainer(Component)
        self.__link_manager = LinkManager()
        self.set_father(self.__port)
        self.set_father(self.__com)
        self.set_father(self.__link_manager)

    @property
    def port(self):
        return self.__port

    @property
    def component(self):
        return self.__com

    def new(self,**args):
        for name,item in args.items():
            if hasattr(self,name):
                raise NameError("The name '%s' has used in this Component." % name)
            elif isinstance(item,Component):
                self.component.new(**{name:item})
            elif isinstance(item,Port):
                self.port.new(**{name:item})
            else:
                raise TypeError("The item new in a Component should be a Port or a Component,should not be a %s" % type(item))
            setattr(self,name,item)

    def link(self,*args):
        self.__link_manager.link(*args)

    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    def gen_rtl_io(self):
        return self.__port.gen_rtl_io()

    def gen_rtl_inst(self):
        p_inst = self.__port.gen_rtl_inst()
        text   = ['%s %s (' %(self.module_name,self.name)]
        text  += ['    %s,' % t for t in p_inst[0:-1]] + ['    %s);'% p_inst[-1]] if len(p_inst)>1 else ['    %s);'% p_inst[-1]]
        #text  += [');']
        return text

    def gen_rtl_def(self):
        p_def = self.__port.gen_rtl_def()
        text  = ['module %s(' % self.module_name]
        text += ['    %s,' % t for t in p_def[0:-1]] + ['    %s'% p_def[-1]] if len(p_def)>1 else ['    %s'% p_def[-1]]
        text += [');','']
        text += ['    %s' % t for t in self.__com.gen_rtl_io()] + ['']
        text += ['    %s' % t for t in self.__link_manager.gen_rtl_link()] + ['']
        text += ['    %s' % t for t in self.__com.gen_rtl_inst()]
        text += ['endmodule']
        return text



    def gen_file(self,path='./',recursion=True):
        if not os.path.exists(path):
            os.makedirs(path)

        f  = os.path.join(path,'%s.v' % self.module_name)
        if os.path.exists(f):
            os.remove(f)
            
        fp = open(f,'w')
        fp.write('\n'.join(self.gen_rtl_def()))
        fp.close()

        for item in self.__com():
            item.gen_file()
