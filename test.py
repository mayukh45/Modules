from enum import Enum

class A:
    class Direction(Enum):
        INPUT = "input"
        OUTPUT = "output"
        INOUT = "inout"

    def __init__(self):
        self.a = 2
        self.b = 3
    def lol(self):
        return self.a - 5

a = A()
print(a.__dict__)