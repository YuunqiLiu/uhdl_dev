import os,shutil


def gen_file(path='./',recursion=True):
    if not os.path.exists(path):
        os.makedirs(path)
    #else:

    f  = os.path.join(path,'test.v')
    if os.path.exists(f):
        shutil.rmtree(f)
        
    fp = open(f,'w')
    fp.close()


gen_file()