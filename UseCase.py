from BusParser import BusParser
trial = BusParser("astob.yaml" ,"astob")
trial.remove_sub_dict("astob.snoop")
trial.add_super_node("astob.wr","ingress")
trial.add_super_node("astob.rd","ingress")
trial.flip_op("astob.ingress")
trial.copy("astob.ingress" , "egress0")
trial.copy("astob.egress0" , "egress1")
trial.copy("astob.egress0" , "egress2")
trial.copy("astob.egress0" , "egress3")
trial.dyaml("trial.yaml")
