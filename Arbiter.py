from math import log2,ceil
from templates import arbiter_body_template,weight_update_template
import sys


class Arbiter:

    def __init__(self, numclients, weight=None):
        self.NumClients = numclients
        self.EncodedNumClients = int(ceil(log2(numclients)))
        self.arbiter_body = None
        self.weight = weight

    def shift_request(self):
        shift_request_code = "case (rotate_ptr["+str(self.EncodedNumClients - 1)+":0])\n\t\t\t" \
                        + str(self.EncodedNumClients)+"'b"+"0"*self.EncodedNumClients + ": shift_req["+str(self.NumClients-1)+":0] = " \
                        "req["+str(self.NumClients-1)+":0];\n\t\t\t" + \
                        str(self.EncodedNumClients)+"'b"+"0"*(self.EncodedNumClients-1)+"1: shift_req[" + str(self.NumClients-1)+":0] = " \
                        "{req[0],req["+str(self.NumClients-1)+":1]};\n\t\t\t"

        for i in range(2, self.NumClients-1):
            shift_request_code += str(self.EncodedNumClients)+"'b"+"0"*(self.EncodedNumClients-len(bin(i)[2:]))+bin(i)[2:]+":" \
                            " shift_req["+str(self.NumClients-1)+":0] = {req["+str(i-1)+":0],req["+str(self.NumClients-1)+":" \
                            + str(i)+"]};\n\t\t\t"

        shift_request_code += str(self.EncodedNumClients)+"'b"+bin(self.NumClients-1)[2:]+": shift_req["+str(self.NumClients-1)+":0] = " \
                         "{req["+str(self.NumClients-2)+":0],req["+str(self.NumClients-1)+"]};"
        self.arbiter_body = self.arbiter_body.replace("//SHIFT_REQUEST",shift_request_code)

    def shift_grant(self):
        shift_grant_code = "shift_grant["+str(self.NumClients-1)+":0] = " +str(self.NumClients)+"" \
                            "'b0;\n\t\t\tif (shift_req[0])	shift_grant[0] = 1'b1;\n\t\t\t"

        for i in range(1,self.NumClients):
            shift_grant_code += "else if (shift_req["+str(i)+"])	shift_grant["+str(i)+"] = 1'b1;\n\t\t\t"

        self.arbiter_body = self.arbiter_body.replace("//SHIFT_GRANT",shift_grant_code)

    def grant_signal(self):
        grant_signal_code = "case (rotate_ptr["+str(self.EncodedNumClients - 1)+":0])\n\t\t\t" \
                        + str(self.EncodedNumClients)+"'b"+"0"*self.EncodedNumClients + ": grant_comb["+str(self.NumClients-1)+":0] = " \
                        "shift_grant["+str(self.NumClients-1)+":0];\n\t\t\t" + \
                        str(self.EncodedNumClients)+"'b"+"0"*(self.EncodedNumClients-1)+"1: grant_comb[" + str(self.NumClients-1)+":0] = " \
                        "{shift_grant["+str(self.NumClients-2)+":0]," \
                        "shift_grant["+str(self.NumClients-1)+"]};\n\t\t\t"

        for i in range(self.NumClients-3, 0, -1):
            grant_signal_code += str(self.EncodedNumClients)+"'b"+"0"*(self.EncodedNumClients-len(bin(self.NumClients-i-1)[2:]))+bin(self.NumClients-i-1)[2:]+":" \
                            " grant_comb["+str(self.NumClients-1)+":0] = {shift_grant["+str(i)+":0],shift_grant["+str(self.NumClients-1)+":" \
                            + str(i+1)+"]};\n\t\t\t"
        grant_signal_code += str(self.EncodedNumClients)+"'b"+bin(self.NumClients-1)[2:]+":" \
                            " grant_comb["+str(self.NumClients-1)+":0] = {shift_grant[0],shift_grant["+str(self.NumClients-1)+":1]};\n"

        self.arbiter_body = self.arbiter_body.replace("//GRANT_SIGNAL",grant_signal_code)

    def rotate(self):
        rotate_code = ""
        for i in range(self.NumClients):
            rotate_code += "grant["+str(i)+"]: rotate_ptr["+str(self.EncodedNumClients-1)+":0] <= " \
             + ("| nweight"+str(i)+" ?  : rotate_ptr :" if self.weight is not None else "")+str(self.EncodedNumClients)+"'d"+str((i+1) % self.NumClients)+";\n\t\t\t"

        self.arbiter_body = self.arbiter_body.replace("//ROTATION",rotate_code)

    def declare_weight_inputs(self):
        declaration = "\n".join(["cfg_weight" + str(i) + "," for i in range(self.NumClients)])
        self.arbiter_body = self.arbiter_body.replace("//CFG_DECLARATIONS", ","+declaration)

    def declare_weight_vectors(self):
        declaration = "\n".join(["input ["+str(self.weight)+":0] cfg_weight"+str(i)+";"  for i in range(self.NumClients)])
        self.arbiter_body = self.arbiter_body.replace("//INPUT_WEIGHT_VECTORS", declaration)

    def declare_weight_registers(self):
        declaration = "\n".join(["reg ["+str(self.weight)+":0] weight" + str(i) + ";" for i in range(self.NumClients)])
        self.arbiter_body = self.arbiter_body.replace("//WEIGHT_REGISTERS", declaration)

    def get_body(self):
        self.arbiter_body = arbiter_body_template
        self.arbiter_body = self.arbiter_body.replace("ENCODEDNUMCLIENTS - 1", str(self.EncodedNumClients - 1))
        self.arbiter_body = self.arbiter_body.replace("ENCODEDNUMCLIENTS", str(self.EncodedNumClients))
        self.arbiter_body = self.arbiter_body.replace("NUMCLIENTS - 1", str(self.NumClients - 1))
        self.arbiter_body = self.arbiter_body.replace("NUMCLIENTS", str(self.NumClients))
        self.shift_request()
        self.shift_grant()
        self.grant_signal()
        self.rotate()
        if self.weight is not None:
            self.declare_weight_inputs()
            self.declare_weight_registers()
            self.declare_weight_vectors()
            self.arbiter_body = self.arbiter_body +"\n"+ self.update_weight_code()

    def update_weight_code(self):
        update_weight_code = weight_update_template
        update_weight_code = update_weight_code.replace("//WEIGHT_BIT", "\n".join(["weight" + str(i) + " <= "+str(self.weight+1)+"'d0;" for i in range(self.NumClients)]))
        update_weight_code = update_weight_code.replace("//WEIGHT_NEGATION", "\n".join(["weight" + str(i) + " <= " + "nweight" + str(i) + ";" for i in range(self.NumClients)]))
        update_weight_code = update_weight_code.replace("//REFRESH_WEIGHT", " & ".join(["(~|weight" + str(i)+")" for i in range(self.NumClients)]) + ";")
        assign_weight = ""
        for i in range(self.NumClients):
            assign_weight += "assign nweight"+str(i)+" = refresh_weights ? cfg_weight"+str(i)+" :  (req["+str(i)+"] & gnt["+str(i)+"]) ? " \
                            "weight"+str(i)+" - 1'b1 :   weight"+str(i)+";\n"
        update_weight_code = update_weight_code.replace("//ASSIGN_WEIGHT",assign_weight)
        return update_weight_code

    def __str__(self):
        return self.arbiter_body + "endmodule"


if len(sys.argv) > 2:
    trial = Arbiter(int(sys.argv[1]), int(sys.argv[2]))
else:
    trial = Arbiter(int(sys.argv[1]))

trial.get_body()
print(trial)
