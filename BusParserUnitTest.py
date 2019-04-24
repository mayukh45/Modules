from BusParser import BusParser
import copy
trial = BusParser("/home/mayukhs/Documents/smartasic2/refbuses/astob_heavy.yaml","astob")
temp = copy.deepcopy(trial.dict["astob"]["hier1"])

trial.dyaml("loaded.yaml")

trial.widop_flat("wdata", 10)
trial.widop_flat("rdata",10)
trial.remove_node_flat("hier1")
trial.add_sub_dict_flat("snoop", {"hello" : "world"})
trial.flipop_flat("snoop")
trial.dyaml("transit.yaml")
####################################
trial.widop_flat("rdata", 18)
trial.widop_flat("rdata", 18)

#trial.dyaml("**astob.yaml")
