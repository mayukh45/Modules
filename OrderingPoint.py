from templates import ordering_point_template
import sys

class OrderingPoint:
    def __init__(self, numclients):
        self.NumClients = numclients
        self.body = None

    def module_declaration(self):
        code = "\n".join(["decoded_req"+str(i)+"," for i in range(self.NumClients)])
        code += "\n"+"\n".join(["snoop_match" + str(i) + "," for i in range(self.NumClients)])
        code += "\n"+"\n".join(["legal_decoded_req" + str(i) + "," for i in range(self.NumClients)])
        self.body = self.body.replace("//MODULE_DEC", code)

    def io_declaration(self):
        code = "\n".join(["input decoded_req"+str(i)+";" for i in range(self.NumClients)])
        code += "\n" + "\n".join(["input snoop_match" + str(i) + ";" for i in range(self.NumClients)])
        code += "\n" + "\n".join(["output legal_decoded_req" + str(i) + ";" for i in range(self.NumClients)])
        self.body = self.body.replace("//I/O_DEC", code)

    def assign_wires(self):
        code = "\n"
        for i in range(self.NumClients):
            code += "wire assign legal_decoded_req"+str(i)+" =(\n"+"|\n".join(["snoop_match"+str((i+j)%self.NumClients) for j in range(self.NumClients)])+") ? 1'b0 : 1'b1;\n\n"

        self.body = self.body.replace("//WIRE_ASSIGN", code)

    def get_body(self):
        self.body = ordering_point_template
        self.body = self.body.replace("NUMCLIENTS", str(self.NumClients))
        self.module_declaration()
        self.io_declaration()
        self.assign_wires()

    def __str__(self):
        self.get_body()
        return self.body

print(OrderingPoint(int(sys.argv[1])))


