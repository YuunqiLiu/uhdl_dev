

class Bits():

    def __init__(self,width,value=0):
        self.__width = width
        self.__value = value

    @property
    def width(self):
        return self.__width

    @property
    def value(self):
        return self.__value

    @property
    def template(self):
        return self

    @property
    def string(self):
        return '%s\'b%s' % (self.__width,bin(self.__value).replace('0b','') )           #pass

    def __eq__(self,other):
        #print(self,other)
        #print(self.width,other.width)
        return True if type(self) == type(other) and self.width == other.width else False



class UInt(Bits):
    pass

class SInt(Bits):
    pass
  