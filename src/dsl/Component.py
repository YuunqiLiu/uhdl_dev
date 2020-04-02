import os,shutil
from operator       import concat
from functools      import reduce

from .Root          import Root
from .Variable      import Wire,IOSig,IOGroup,Variable
from .              import FileProcess

#from .VFile         import VFile
#from .              import FileProcess
#from .Value         import Value

class Component(Root):

    def __init__(self):
        super(Component,self).__init__()
        self.set_father_type(Component)
        self.__vfile     = None
        self.output_path = './%s' % self.module_name

    @property
    def module_name(self):
        return type(self).__name__

    @property
    def vfile(self):
        return self.__vfile

    @property
    def var_list(self) -> list:
        return [self.__dict__[k] for k in self.__dict__ if isinstance(self.__dict__[k],Variable)]

    @property
    def wire_list(self) -> list:
        return [self.__dict__[k] for k in self.__dict__ if isinstance(self.__dict__[k],Wire)]

    @property
    def io_list(self) -> list:
        return [self.__dict__[k] for k in self.__dict__ if isinstance(self.__dict__[k],(IOSig,IOGroup))]

    @property
    def component_list(self) -> list:
        return [self.__dict__[k] for k in self.__dict__ if isinstance(self.__dict__[k],Component) and k != '_father']

    @property
    def verilog_outer_def(self):
        return reduce(concat,[i.verilog_outer_def for i in self.io_list])

    @property
    def verilog_def(self):
        str_list = ['module %s (' % self.module_name]

        # module io define
        io_def_str_list = reduce(concat,[i.verilog_def for i in self.io_list],[])

        for i in io_def_str_list[0:-1]:
            str_list.append('\t%s,' % i )
        str_list.append('\t%s);' % io_def_str_list[-1])

        # module wire define
        str_list+=['','\t//Wire define for this module.']
        wire_def_str_list = reduce(concat,[i.verilog_def for i in self.wire_list],[])
        for i in wire_def_str_list:
            str_list.append('\t%s;' % i)

        str_list+=['','\t//Wire define for sub module.']
        sub_wire_def_str_list = reduce(concat,[i.verilog_outer_def for i in self.component_list],[])
        for i in sub_wire_def_str_list:
            str_list.append('\t%s;' % i)

        # combine logic assignment
        str_list+=['','\t//Wire sub module connect to this module and inter module connect.']
        assign_str_list = reduce(concat,[i.verilog_assignment for i in self.var_list if i.verilog_assignment is not None],[])
        for i in assign_str_list:
            str_list.append('\t%s;' % i)

        str_list+=['','\t//Wire this module connect to sub module.']
        sub_io_list = reduce(concat,[i.io_list for i in self.component_list],[])
        sub_assign_str_list = reduce(concat,[i.verilog_assignment for i in sub_io_list if i.verilog_assignment is not None],[])
        for i in sub_assign_str_list:
            str_list.append('\t%s;' % i)

        # component inst
        str_list+=['','\t//module inst.']
        comp_inst_str_list = reduce(concat,[i.verilog_inst for i in self.component_list],[])
        for i in comp_inst_str_list:
            str_list.append('\t%s' % i)

        str_list+=['','endmodule']
        return str_list

    @property
    def verilog_inst(self):
        str_list = ['%s %s (' % (self.module_name,self.name)]

        io_inst_str_list = reduce(concat,[i.verilog_inst for i in self.io_list])

        for i in io_inst_str_list[0:-1]:
            str_list.append('\t%s,' % i )
        str_list.append('\t%s);' % io_inst_str_list[-1])

        return str_list

    def create_this_vfile(self,path):
        FileProcess.create_file(os.path.join(path,'%s.v' % self.module_name),self.verilog_def)

    def create_all_vfile(self,path):
        self.create_this_vfile(path)
        for c in self.component_list:
            c.create_all_vfile(path)

    def generate_verilog(self,iteration=False):
        FileProcess.refresh_directory(self.output_path)
        if iteration:
            self.create_all_vfile(self.output_path)
        else:
            self.create_this_vfile(self.output_path)
            

    #@property
    #def output_list(self) -> list:
    #    return [self.__dict__[k] for k in self.__dict__ if isinstance(self.__dict__[k],Output)]
    #@property
    #def lvalue_list(self):
    #    return [self.__dict__[k] for k in self.__dict__ if isinstance(self.__dict__[k],Value)]

        #self.circuit()
    #def __new__(cls):
    #    obj = object.__new__(cls)
    #    obj.init()    
    #    return obj

#    #def __init__(self):
#    #    print('233')

    #def init(self):
    #    super(type(self),self).__init__()


        #Entity.__init__(self)
        # self.set_name(module_name)
        #self.__port = PortContainer(Interface)
        #self.__com  = ComponentContainer(Component)
        #self.__link_manager = LinkManager()
        #self.set_father(self.__port)
        #self.set_father(self.__com)
        #self.set_father(self.__link_manager)

    #def set_father_to_sub(self):
    #    for l in self.lvalue_list:
    #        self.set_father(l)

    #     p_def = self.__port.gen_rtl_def()
    #     text  = ['module %s(' % self.module_name]
    #     text += ['    %s,' % t for t in p_def[0:-1]] + ['    %s'% p_def[-1]] if len(p_def)>1 else ['    %s'% p_def[-1]]
    #     text += [');','']
    #     text += ['    %s' % t for t in self.__com.gen_rtl_io()] + ['']
    #     text += ['    %s' % t for t in self.__link_manager.gen_rtl_link()] + ['']
    #     text += ['    %s' % t for t in self.__com.gen_rtl_inst()]
    #     text += ['endmodule']

    # def gen_rtl_def(self):
    #     p_def = self.__port.gen_rtl_def()
    #     text  = ['module %s(' % self.module_name]
    #     text += ['    %s,' % t for t in p_def[0:-1]] + ['    %s'% p_def[-1]] if len(p_def)>1 else ['    %s'% p_def[-1]]
    #     text += [');','']
    #     text += ['    %s' % t for t in self.__com.gen_rtl_io()] + ['']
    #     text += ['    %s' % t for t in self.__link_manager.gen_rtl_link()] + ['']
    #     text += ['    %s' % t for t in self.__com.gen_rtl_inst()]
    #     text += ['endmodule']
    #     return text

    #@property
    #def port(self):
        #return self.__port
    #    pass

    #@property
    #def component(self):
        #return self.__com
    #    pass

    # def new(self,**args):
    #     for name,item in args.items():
    #         if hasattr(self,name):
    #             raise NameError("The name '%s' has used in this Component." % name)
    #         elif isinstance(item,Component):
    #             self.component.new(**{name:item})
    #         elif isinstance(item,Interface):
    #             self.port.new(**{name:item})
    #         else:
    #             raise TypeError("The item new in a Component should be a Port or a Component,should not be a %s" % type(item))
    #         setattr(self,name,item)

    # def link(self,*args):
    #     self.__link_manager.link(*args)

    #=============================================================================================
    # RTL gen 
    #=============================================================================================

    # def gen_rtl_io(self):
    #     return self.__port.gen_rtl_io()
    # 
    # def gen_rtl_inst(self):
    #     p_inst = self.__port.gen_rtl_inst()
    #     text   = ['%s %s (' %(self.module_name,self.name)]
    #     text  += ['    %s,' % t for t in p_inst[0:-1]] + ['    %s);'% p_inst[-1]] if len(p_inst)>1 else ['    %s);'% p_inst[-1]]
    #     #text  += [');']
    #     return text
    # 
    # def gen_rtl_def(self):
    #     p_def = self.__port.gen_rtl_def()
    #     text  = ['module %s(' % self.module_name]
    #     text += ['    %s,' % t for t in p_def[0:-1]] + ['    %s'% p_def[-1]] if len(p_def)>1 else ['    %s'% p_def[-1]]
    #     text += [');','']
    #     text += ['    %s' % t for t in self.__com.gen_rtl_io()] + ['']
    #     text += ['    %s' % t for t in self.__link_manager.gen_rtl_link()] + ['']
    #     text += ['    %s' % t for t in self.__com.gen_rtl_inst()]
    #     text += ['endmodule']
    #     return text

    #=============================================================================================
    # output verilog/file list generate
    #=============================================================================================

    #def check_vfile(self,func):



    #    return vfile

    #@FileProcess.check_vfile
    # def gen_vfile(self,path='-',recursion=True):
    #     path = self.output_path if path == '-' else path
    #     
    #     sub_vfile   = self.__com.gen_vfile(path=path,recursion=recursion)
    #     top_path    = FileProcess.create_file(  path = os.path.join(path,self.module_name+'.v'),
    #                                             text = self.gen_rtl_def())
    #     file_list   = FileProcess.file_list_dedup(reduce(concat,[p.file_list for p in sub_vfile],[]) + [top_path])
    #     
    #     #self.__vfile = VFile(path = path,top_path = top_path,file_list = file_list)
    #     #return self.__vfile
    #     return VFile(path = path,top_path = top_path,file_list = file_list)
    # 
    # 
    # def gen_flist(self,abs_path=False,path='-'):
    #     path = self.output_path if path == '-' else path
    #     FileProcess.create_file( path = os.path.join(path,'flist.f'),
    #                              text = [os.path.abspath(f) if abs_path else './'+os.path.relpath(f,path) for f in self.__vfile.file_list] )
    # 
    # 
    # def generate(self,abs_path=False,path='-',recursion=True):
    #     path = self.output_path if path == '-' else path
    # 
    #     FileProcess.refresh_directory(path)
    # 
    #     self.__vfile = self.gen_vfile(path=path,recursion=recursion)
    #     self.gen_flist(abs_path=abs_path,path=path)



        #if os.path.exists(path):
        #    shutil.rmtree(path)
            #os.remove(path)

        #file_list   = self.__file_list_process(reduce(concat,[p.file_list for p in sub_vfile],[]) + [top_path])
        #top_path    = self.__gen_file(path=path)


    #def __file_list_process(self,file_list):
    #    new_list=list(set(file_list))
    #    new_list.sort(key=file_list.index)
    #    return new_list 

        # if not os.path.exists(path):
        #     os.makedirs(path)
# 
        # f  = os.path.join(path,'flist.f')
        # if os.path.exists(f):
        #     os.remove(f)
# 
# 
        # 
# 
        # fp = open(f,'w')
        # #print(path)
        # #for f in self.__vfile.file_list:
        # #    print(f)
        # fp.write('\n'.join([os.path.abspath(f) if abs_path else './'+os.path.relpath(f,path) for f in self.__vfile.file_list]))
        # fp.close()


    #def __gen_file(self,path='./'):
    #    if not os.path.exists(path):
    #        os.makedirs(path)
#
    #    f  = os.path.join(path,'%s.v' % self.module_name)
    #    if os.path.exists(f):
    #        os.remove(f)
    #        
    #    fp = open(f,'w')
    #    fp.write('\n'.join(self.gen_rtl_def()))
    #    fp.close()
    #    
    #    return f 