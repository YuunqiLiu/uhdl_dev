
class Wire(object):
    
    INPUT = 1
    OUTPUT = 0

    def __init__(self,direction,data_width):
        if not direction is self.INPUT and not direction is self.OUTPUT:
            raise TypeError()
        if not isinstance(data_width,int):
            raise TypeError()
        if data_width < 1:
            raise ArithmeticError()
        
        self.__direction    = direction
        self.__data_width   = data_width

    @property
    def direction(self):
        return self.__direction
    @property
    def data_width(self):
        return self.__data_width

    def __eq__(self,other):
        if not isinstance(other,Wire):
            raise TypeError()
        else:
            if self.data_width != other.data_width or self.direction != other.direction:
                

w1 = Wire(Wire.INPUT,1)
w2 = Wire(Wire.INPUT,1)



print(w1==w2)