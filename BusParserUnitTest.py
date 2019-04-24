from BusParser import BusParser
import copy
trial = BusParser("/home/mayukhs/Documents/smartasic2/refbuses/astob_heavy.yaml","astob")
temp = copy.deepcopy(trial.dict["astob"]["snoop"])

trial.dyaml("loaded.yaml")

trial.wid_op_flat("wdata", 10)
trial.wid_op_flat("rdata",10)
trial.remove_node_flat("hier1")
trial.dyaml("trial3.yaml")
trial.add_sub_dict_flat("snoop", {"hello" : "world"})
#print(trial.get_path("sdata"))
trial.flip_op_flat("wvalid")
trial.dyaml("transition.yaml")



#trial.dyaml("**astob.yaml")
