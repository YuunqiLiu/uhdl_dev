

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


class UInt(Bits):

    pass

class SInt(Bits):

    pass
  