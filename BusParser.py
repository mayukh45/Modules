import yaml
import collections
import copy
import queue


class BusParser:
    def __init__(self, filepath, bus_name):
        self.dict = yaml.load(open(filepath).read())
        self.BusName = bus_name

    #=============================================================================================================================================
    # Used to craate an useful net name for each signal for example cpu_2_peripheral0_* bus. It overloads the prefix and prefloat directly
    #
    #=============================================================================================================================================

    def wid_op_flat(self, key, width):
        """Wrapper function for non heiarchical operations"""
        self.wid_op(self.get_path(key),width)

    def flip_op_flat(self, key):
        """Wrapper function for non heiarchical operations"""
        self.flip_op(self.get_path(key))

    def prefixop_flat(self, key, prefix):
        """Wrapper function for non heiarchical operations"""
        self.prefixop(self.get_path(key), prefix)

    def prefloatop_flat(self, key, prefloat):
        """Wrapper function for non heiarchical operations"""
        self.prefloatop(self.get_path(key),prefloat)

    def remove_sub_dict_flat(self, key):
        """Wrapper function for non heiarchical operations"""
        self.remove_sub_dict(self.get_path(key))

    def add_super_node_flat(self, key, node):
        """Wrapper function for non heiarchical operations"""
        self.add_super_node(self.get_path(key), node)

    def rename_flat(self, key, new_name):
        """Wrapper function for non heiarchical operations"""
        self.rename(self.get_path(key),new_name)

    def copy_flat(self, key, new_name):
        """Wrapper function for non heiarchical operations"""
        self.copy(self.get_path(key), new_name)

    def remove_node_flat(self, key):
        """Wrapper function for non heiarchical operations"""
        self.remove_node(self.get_path(key))

    def add_sub_dict_flat(self, key, sub_dict):
        """Wrapper function for non heiarchical operations"""
        self.add_sub_dict(self.get_path(key),sub_dict)

    def get_subdict_flat(self, key, u):
        """Wrapper function for non heiarchical operations"""
        self.get_subdict(self.get_path(key),u)

    def add_world_view(self, world_view):
        """Adds world view like usb2cpu to the ports"""
        self.prefixop(self.BusName, world_view)
        self.prefloatop(self.BusName, world_view)

    def wid_op(self, exp, width):
        """Changes width of a fluid port"""
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        if temp['type'] == 'nonfluid':
            raise Exception("The width of this signal cannot be changed")
        else:
            temp['width'] = width

    def flip_op(self, exp):
        """Flips all the ports of a subtdict provided by heiarchy"""
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        print(heiarchy[len(heiarchy)-1])

        self.flip(temp)

    def flip(self, u):
        """
        Used by flip_op
        :param u:
        :return: flipped subdict
        """
        for k, v in u.items():
            if isinstance(v, collections.Mapping):
                u[k] = self.flip(u.get(k))

            else:
                u['direction'] = 'output' if u['direction'] == 'input' else 'input'
        return u

    def print(self):
        """
        Prints the current dictionary
        :return: None
        """
        print(self.dict)

    def dyaml(self, filename):
        """
        Dumps the current dict to a yaml.
        :param filename: File path to which the dyaml will be dumped
        :return: None
        """
        noalias_dumper = yaml.dumper.SafeDumper
        noalias_dumper.ignore_aliases = lambda self , data : True
        with open(filename,"w") as f:
            f.write(yaml.dump(self.dict,default_flow_style = False,Dumper = noalias_dumper))

        f.close()

    def prefixop(self, exp, prefix):
        """
        Adds prefix to the
        :param exp: The heiarchy of the node to whose subdict the prefix is added. Eg: "astob.wr"
        :param prefix: Eg: usb2cpu
        :return: None
        """
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        self.change_prefix(temp,prefix)

    def prefloatop(self, exp, prefloat):
        """
        Adds prefix to the
        :param exp: The heiarchy of the node to whose subdict the prefix is added. Eg: "astob.wr"
        :param prefloat: Eg: usb2cpu
        :return: None
        """
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for levels in heiarchy:
            temp = temp[levels]

        self.change_prefloat(temp,prefloat)

    def change_prefix(self, u, pf):
        """

        :param u: the subdict to which prefix is to be added.
        :param pf: the prefix
        :return: returns changed subdict
        """
        for k in list(u.keys()):
            if isinstance(u.get(k), collections.Mapping):
                u[k] = self.change_prefix(u.get(k), pf)

            else:
                u['prefix'] = pf
        return u

    def change_prefloat(self, u, pf):
        """

        :param u: the subdict whose prefloat is to be changed.
        :param pf: the prefloat.
        :return: the changed subdict.
        """
        for k in list(u.keys()):
            if isinstance(u.get(k), collections.Mapping):
                u[k] = self.change_prefloat(u.get(k), pf)

            else:
                u['prefloat'] = pf
        return u

    """
    def port_names(self, u, names)
            for k in list(u.keys()):
            if list(u[k].keys())[0] != "direction":
                u[k] = self.port_names(u.get(k), names)

            else:
                if not any([u == i for i in names]):
                    names.append(u)
        return names
    """
    def remove_sub_dict(self, exp):
        """

        :param exp: Heiarchy of the node whose subdict is to be removed for eg: "astob.rd"
        :return: None
        """
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for i in range(len(heiarchy)):
           # print(temp)
            temp = temp[heiarchy[i]]

        #print(temp)
        del temp[heiarchy[len(heiarchy)-1]]

    def add_super_node(self,exp,node):
        """

        :param exp: Heiarchy of the node which becomes child of the super node to be added.
        :param node: super node's name
        :return: None
        """
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for i in range(len(heiarchy) - 1):
            temp = temp[heiarchy[i]]
        sub_dict = copy.deepcopy(temp[heiarchy[len(heiarchy)-1]])
        del temp[heiarchy[len(heiarchy) - 1]]
        temp = self.dict.copy()
        for i in range(len(heiarchy)-2):
            temp = temp [heiarchy[i]]
        #print(temp)
        if not node in list(temp[heiarchy[len(heiarchy)-2]].keys()):
            temp[heiarchy[len(heiarchy)-2]][node] = {heiarchy[len(heiarchy)-1]:sub_dict}
        else:
            #print("1"*52)
            temp[heiarchy[len(heiarchy)-2]][node].update({heiarchy[len(heiarchy)-1]:sub_dict})

    def rename(self,exp,new_name):
        """

        :param exp: Heiarchy of the node to be renamed.
        :param new_name: New name of the node.
        :return: None
        """
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for i in range(len(heiarchy) - 1):
            temp = temp[heiarchy[i]]
        sub_dict = copy.deepcopy(temp[heiarchy[len(heiarchy) - 1]])
        del temp[heiarchy[len(heiarchy) - 1]]
        temp = self.dict.copy()
        for i in range(len(heiarchy) - 1):
            temp = temp[heiarchy[i]]

        temp[new_name] = sub_dict

    def copy(self,exp,new_name):
        """

        :param exp: Heiarchy of the subdict to be copied.
        :param new_name: Node to which its copied on the same Level.
        :return: None
        """
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for i in range(len(heiarchy) - 1):
            temp = temp[heiarchy[i]]

        sub_dict = copy.deepcopy(temp[heiarchy[len(heiarchy)-1]])
        temp.update({new_name: sub_dict})

    def remove_node(self, exp):
        """

        :param exp: Heiarchy of the node to be removed
        :return: None
        """
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for i in range(len(heiarchy) - 1):
            temp = temp[heiarchy[i]]

        #del temp[heiarchy[len(heiarchy)-1]]
        sub_dict = copy.deepcopy(temp[heiarchy[len(heiarchy) - 1]])
        del temp[heiarchy[len(heiarchy)-1]]
        temp.update(sub_dict)

    def add_sub_dict(self,exp,sub_dict):
        """

        :param exp: Heiarchy of the node to which subdict will be added.
        :param sub_dict: subdict to add
        :return: None
        """
        heiarchy = exp.split(".")
        temp = self.dict.copy()
        for i in range(len(heiarchy)):
            temp = temp[heiarchy[i]]

        temp.update(sub_dict)

    def get_path(self, key):
        """
        Returns heiarchical path of a key
        :param key: a unique key of the dictionary.
        :return: Returns a string which denotes the heiarchical path of the key.
        """
        qu = queue.Queue(maxsize=1000)
        qu.put(self.BusName)
        while not qu.empty():
            path = qu.get()
            temp_dict = self.get_subdict(path, self.dict)
            if isinstance(temp_dict, collections.Mapping):
                for k in temp_dict.keys():
                    if k == key:
                        return path + "." + k
                 #   print(path + "." + k)
                    qu.put(path + "." + k)

    def get_subdict(self,exp,u):
        """

        :param exp: Heiarchy of the subdict to be fetched
        :param u: original dictionary
        :return: None
        """
        heiarchy = exp.split(".")
        temp = u.copy()
      #  print(temp)
        for levels in heiarchy:
            temp = temp[levels]
        return temp








