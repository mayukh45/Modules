from BusParser import BusParser
import copy
trial = BusParser("astob.yaml" ,"astob")
temp = copy.deepcopy(trial.dict["astob"]["snoop"])

trial.dyaml("loaded.yaml")


trial.remove_sub_dict("astob.snoop")
trial.add_super_node("astob.wr","ingress")
trial.add_super_node("astob.rd","ingress")
trial.flip_op("astob.ingress")

trial.copy("astob.ingress" , "egress0")
trial.copy("astob.egress0" , "egress1")
trial.copy("astob.egress0" , "egress2")
trial.copy("astob.egress0" , "egress3")
trial.dyaml("trial.yaml")
trial.remove_sub_dict("astob.egress0")
trial.remove_sub_dict("astob.egress1")
trial.remove_sub_dict("astob.egress2")
trial.remove_sub_dict("astob.egress3")
#trial.dyaml("trial1.yaml")
trial.remove_node("astob.ingress")
trial.dyaml("trial1.yaml")


trial.add_sub_dict("astob.snoop",temp)
trial.flip_op("astob.snoop")
trial.flip_op("astob")

trial.dyaml("**astob.yaml")
