import os,shutil
from operator import concat
from functools import reduce


#import FileProcess
from .              import FileProcess

from .VFile         import VFile
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
        self.__vfile = None
        self.output_path = './'

    @property
    def port(self):
        return self.__port

    @property
    def component(self):
        return self.__com

    @property
    def vfile(self):
        return self.__vfile

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

    #=============================================================================================
    # output verilog/file list generate
    #=============================================================================================

    #def check_vfile(self,func):



    #    return vfile

    #@FileProcess.check_vfile
    def gen_vfile(self,path='-',recursion=True):
        path = self.output_path if path == '-' else path
        
        sub_vfile   = self.__com.gen_vfile(path=path,recursion=recursion)
        top_path    = FileProcess.create_file(  path = os.path.join(path,self.module_name+'.v'),
                                                text = self.gen_rtl_def())
        file_list   = FileProcess.file_list_dedup(reduce(concat,[p.file_list for p in sub_vfile],[]) + [top_path])
        
        #self.__vfile = VFile(path = path,top_path = top_path,file_list = file_list)
        #return self.__vfile
        return VFile(path = path,top_path = top_path,file_list = file_list)


    def gen_flist(self,abs_path=False,path='-'):
        path = self.output_path if path == '-' else path
        FileProcess.create_file( path = os.path.join(path,'flist.f'),
                                 text = [os.path.abspath(f) if abs_path else './'+os.path.relpath(f,path) for f in self.__vfile.file_list] )


    def generate(self,abs_path=False,path='-',recursion=True):
        path = self.output_path if path == '-' else path

        FileProcess.refresh_directory(path)

        self.__vfile = self.gen_vfile(path=path,recursion=recursion)
        self.gen_flist(abs_path=abs_path,path=path)



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