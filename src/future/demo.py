from auto_fab import *


fab0 = Fab()
fab0.addr_width = 32
fab0.master_num = 10
fab0.slave_num  = 10

fab1 = Fab()
fab1.addr_width = 32
fab1.master_num = 10
fab1.slave_num  = 10

link(fab0.m[0],fab1.s[2])