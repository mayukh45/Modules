a = {'astob': {'rd': {'data': {'direction': 'output', 'type': 'fluid', 'width': 18}, 'ready': {'direction': 'input', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'output', 'type': 'nonfluid', 'width': 1}}, 'snoop': {'data': {'direction': 'input', 'type': 'fluid', 'width': 18}, 'match': {'direction': 'input', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'input', 'type': 'nonfluid', 'width': 1}}, 'wr': {'data': {'direction': 'input', 'type': 'fluid', 'width': 18}, 'ready': {'direction': 'output', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'input', 'type': 'nonfluid', 'width': 1}}}}
import collections
import queue

class B:
    def __init__(self,a):
        self.A = a

b = B(2)
b.__init__(3)
print(b.A)
