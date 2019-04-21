a = {'astob': {'rd': {'data': {'direction': 'output', 'type': 'fluid', 'width': 18}, 'ready': {'direction': 'input', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'output', 'type': 'nonfluid', 'width': 1}}, 'snoop': {'data': {'direction': 'input', 'type': 'fluid', 'width': 18}, 'match': {'direction': 'input', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'input', 'type': 'nonfluid', 'width': 1}}, 'wr': {'data': {'direction': 'input', 'type': 'fluid', 'width': 18}, 'ready': {'direction': 'output', 'type': 'nonfluid', 'width': 1}, 'valid': {'direction': 'input', 'type': 'nonfluid', 'width': 1}}}}
import collections
import queue


def port_names(u, names):
    """

    :param u: Takes the dictionary
    :param names: A list which contains the port names , empty at the beginning as names is built recursively.
    :return: names.
    """
    for k in list(u.keys()):
        if list(u[k].keys())[0] != "direction":
            u[k] = port_names(u.get(k), names)

        else:
            if not any([u[k] == i for i in names]):
                names.append(u[k])
    return names


print(port_names(a,[]))

