from BusParser import BusParser
import copy
trial = BusParser("/home/mayukhs/Dpcuments/refbuses/astob_heavy.yaml","astob")
temp = copy.deepcopy(trial.dict["astob"]["snoop"])

trial.dyaml("loaded.yaml")

trial.wid_op_flat("wdata", 10)
trial.wid_op_flat("rdata" ,10)
trial.remove_node_flat("heir1")
trial.add_sub_dict_flat("snoop" , {"hello" : "world"})
trial.prefixop_flat("sdata","usb2usb")
trial.prefixop_flat("sdata", "usb2cpu")
trial.flip_op_flat("wvalid")
trial.dyaml("trial.yaml")



#trial.dyaml("**astob.yaml")