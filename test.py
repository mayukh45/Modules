a = {'astob': {'rd': {'data': {'direction': 'output', 'type': 'fluid', 'width': 18}, 'ready': {'direction': 'input', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'output', 'type': 'nonfluid', 'width': 1}}, 'snoop': {'data': {'direction': 'input', 'type': 'fluid', 'width': 18}, 'match': {'direction': 'input', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'input', 'type': 'nonfluid', 'width': 1}}, 'wr': {'data': {'direction': 'input', 'type': 'fluid', 'width': 18}, 'ready': {'direction': 'output', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'input', 'type': 'nonfluid', 'width': 1}}}}
import collections
import queue


def get_path(u, busname, key):

    qu = queue.Queue(maxsize=1000)
    qu.put(busname)
    while not qu.empty():
        path = qu.get()
        temp_dict = get_subdict(path,u)
        if isinstance(temp_dict, collections.Mapping):
            for k in temp_dict.keys():
                if k == key:
                    return path+"."+k
                print(path+"."+k)
                qu.put(path+"."+k)

def get_subdict(exp,u):
    heiarchy = exp.split(".")
    temp = u.copy()
    print(temp)
    for levels in heiarchy:
        temp = temp[levels]
    return temp

print(get_path(a,"astob","rd"))

