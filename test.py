import collections
d = {'dir' : 1 , "lol" :{"dir" : 1 , "wtf":{"negro" : 2 , "dir" : 3}}}


def update(u):
    for k, v in u.items():
        if isinstance(v, collections.Mapping):
            u[k] = update(u.get(k))
            print(k)
        else:
            u['dir'] = 0
    return u
print(update(d))