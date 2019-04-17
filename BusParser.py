import yaml
import collections


class BusParser:
    def __init__(self, filepath, bus_name):
        self.dict = yaml.load(open(filepath).read())
        self.BusName = bus_name

    def add_world_view(self, world_view):
        self.prefixop(self.BusName, world_view)
        self.prefloatop(self.BusName, world_view)

    def wid_op(self, exp, width):
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        if temp['type'] == 'nonfluid':
            raise Exception("The width of this signal cannot be changed")
        else:
            temp['width'] = width

    def flip_op(self, exp):
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        print(heiarchy[len(heiarchy)-1])

        self.flip(temp)

    def flip(self, u):
        for k, v in u.items():
            if isinstance(v, collections.Mapping):
                u[k] = self.flip(u.get(k))

            else:
                u['direction'] = 'output' if u['direction'] == 'input' else 'input'
        return u

    def print(self):
        print(self.dict)

    def dyaml(self, filename):
        with open(filename) as f:
            f.write(yaml.dump(self.dict))

        f.close()

    def prefixop(self, exp, prefix):
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        self.change_prefix(temp,prefix)

    def prefloatop(self, exp, prefloat):
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        self.change_prefloat(temp,prefloat)

    def change_prefix(self, u, pf):
        for k in list(u.keys()):
            if isinstance(u.get(k), collections.Mapping):
                u[k] = self.change_prefix(u.get(k), pf)

            else:
                u['prefix'] = pf
        return u

    def change_prefloat(self, u, pf):
        for k in list(u.keys()):
            if isinstance(u.get(k), collections.Mapping):
                u[k] = self.change_prefloat(u.get(k), pf)

            else:
                u['prefloat'] = pf
        return u

    def port_names(self, u, names):
        for k in list(u.keys()):
            if list(u[k].keys())[0] != "direction":
                u[k] = self.port_names(u.get(k), names)

            else:
                if not any([u == i for i in names]):
                    names.append(u)
        return names

    def remove_sub_dict(self,exp):
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for i in range(len(heiarchy)-1):
           # print(temp)
            temp = temp[heiarchy[i]]
        print("1"*50)
        #print(temp)
        del temp[heiarchy[len(heiarchy)-1]]

    def add_super_node(self,exp,node):
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for i in range(len(heiarchy) - 1):
            temp = temp[heiarchy[i]]
        sub_dict = temp[heiarchy[len(heiarchy)-1]]
        del temp[heiarchy[len(heiarchy) - 1]]
        temp = self.dict.copy()
        for i in range(len(heiarchy)-2):
            temp = temp [heiarchy[i]]
        print(temp)
        temp[heiarchy[len(heiarchy)-2]][node]={heiarchy[len(heiarchy)-1]:sub_dict}
