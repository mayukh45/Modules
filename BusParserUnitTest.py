from BusParser import BusParser
import copy
trial = BusParser("/home/mayukhs/Documents/smartasic2/refbuses/astob_heavy.yaml","astob")
temp = copy.deepcopy(trial.dict["astob"]["hier1"])

trial.dyaml("loaded.yaml")

trial.widop_flat("wdata", 10)
trial.widop_flat("rdata",10)
trial.remove_node_flat("hier1")
trial.add_sub_dict_flat("snoop", {"hello" :{"direction": "input"}})
trial.remove_sub_dict_flat("sdata")
trial.flipop_flat("snoop")
trial.flipop_flat("wvalid")
trial.rename_flat("smatch" , "snoopmatch")
trial.rename_flat("rdata" , "readmatch")
trial.copy_flat("snoop" , "snoop_test")
trial.dyaml("transit.yaml")
####################################
trial.widop_flat("wdata", 18)
trial.widop_flat("readmatch", 18)
trial.add_super_node_flat("rd" , "hier1")
trial.remove_sub_dict_flat("hello")
trial.add_sub_dict_flat("snoop" , {"sdata" : {"direction" : "output" , "type" : "fluid" , "width" : 18}})
trial.rename_flat("snoopmatch","smatch")
trial.rename_flat("readmatch" , "rdata")
trial.flipop_flat("wvalid")
trial.flipop_flat("snoop")
trial.remove_sub_dict_flat("snoop_test")

trial.dyaml("Sync.yaml")
