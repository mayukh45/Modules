import yaml
import collections


class BusParser:
    def __init__(self, filename):
        self.dict = yaml.load(open(filename).read())

    def query(self, query, arg, width = None):
        heiarchy = query.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        if arg == "flip":
            self.dict.update({heiarchy[len(heiarchy) - 1]: self.flip(temp)})

        elif arg == "cw":
            if temp['type'] == 'nonfluid':
                raise Exception("The width of this signal cannot be changed")
            else:
                temp['width'] = width
                self.dict.update({heiarchy[len(heiarchy) - 1]: temp})

        else:
            raise Exception("Wrong Argument!")

    def flip(self, u):
        for k, v in u.items():
            if isinstance(v, collections.Mapping):
                u[k] = self.flip(u.get(k))

            else:
                u['direction'] = 'output' if u['direction'] == 'input' else 'input'
        return u
