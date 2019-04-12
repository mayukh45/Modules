from templates import lruArbiter_body
import sys

class LruArbiter:
    def ___init__(self, num_clients):
	self.Num_Clients=num_clients
        self.body = None
    def get_body(self):
        self.body =lruArbiter_body
        self.body = self.body.replace("NUMCLIENTS - 1", str(self.Num_Clients -1))

    def reg_status(self):
	code = "\n"+"\n".join(["req ["+str(self.Num_Clients-1)+":0] req"+str(i)+"_used_status;" for i in range(self.Num_Clients)])
        self.body = self.body.replace("//REG_STATUS", code)

    def status_used(self):
	code="\n"+"\n".join(["req"+str(i)+"_used_status <= "+str(self.Num_clients)+"'d"+str(self.Num_Clients-i)+";" for i in range(self.Num_Clients)])
        self.body=self.body.replace("//STATUS_USED",code)

    def gnt(self):
        code="\n"+"\t".join(["req"+str(i)+"_used_status <= "+str(self.Num_Clients)+"'b1;" if i==j else "req"+str(j)+"_used_status <= req"+str(j)+"_used_status<req"+str(i)+"_used_status ? req"+str(j)+"_used_status + 1'b1 : req"+str(j)_"used_status;" for i in range(self.Num_Clients) for j in range(self.Num_Clients)])
	self.body=self.body.repalce("//GNT_STATS",code)


    def gnt_request(self):
	code="\n"+"\t".join(["(req"+str(i)+"_used_status=="+str(self.Num_Clients)+") ? 1'b1 :"  if j==j else "((req"+str(j)+" & (req"+str(j)+"_used_status > req"+str(i)+"_used_status)) ? 1'b0:" for i in range(self.Num_Clients) for j in  range(self.Num_Clients)])+"\n\t1'b1;"
	self.body=self.body.repalce("//GNT_REQUEST",code)
    
    def __str__(self):
        self.get_body()
        return self.body

print(LruArbiter(int(sys.argv[1])))

