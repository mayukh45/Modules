from math import log2, ceil
import argparse
parser = argparse.ArgumentParser()

parser.add_argument("-b2g", help="binary2gray", action="store_true")
parser.add_argument("-g2b", help="gray2binary", action="store_true")
parser.add_argument("-oh2b", help="onehot2binary", action="store_true")
parser.add_argument("-cw", help="width of data", type = int)

args = parser.parse_args()


class Encoder:
    def __init__(self):
        self.body = None
        self.CodeWidth = None
        self.get_body()

    def binary2gray(self):
        self.CodeWidth = args.cw
        module_dec = "module AH_binary2gray (\nbinary,\ngray,\n);"
        vector_dec = "input  ["+str(self.CodeWidth-1)+":0] binary;\n" \
                      "output ["+str(self.CodeWidth-1)+":0] gray;\n"
        code = "\n".join(["wire assign gray["+str(i)+"] = binary["+str(i+1)+"] ^ binary["+str(i)+"];" for i in range(self.CodeWidth-1)])
        code += "\nwire assign gray["+str(self.CodeWidth-1)+"] = binary[0];\nendmodule"
        self.body = "\n".join([module_dec, vector_dec, code])

    def gray2binary(self):
        self.CodeWidth = args.cw
        module_dec = "module AH_gray2binary (\nbinary,\ngray,\n);"
        vector_dec = "input  [" + str(self.CodeWidth - 1) + ":0] gray;\n" \
                                                            "output [" + str(self.CodeWidth - 1) + ":0] binary;\n"
        code = "\n".join(
            ["wire assign binary[" + str(i) + "] = gray[" + str(i + 1) + "] ^ gray[" + str(i) + "];" for i in
             range(self.CodeWidth - 1)])
        code += "\nwire assign gray[" + str(self.CodeWidth - 1) + "] = binary[0];\nendmodule"
        self.body = "\n".join([module_dec, vector_dec, code])

    def onehot2binary(self):
        self.CodeWidth = args.cw
        module_dec = "module AH_onehot2binary (\nbinary,\nonehot,\n);"
        vector_dec = "input  [" + str(pow(2,self.CodeWidth)-1) + ":0] onehot;\n" \
                        "output [" + str(self.CodeWidth - 1) + ":0] binary;\n" \
                        "wire binary;\n"
        code = "always @(*)\nbegin\n\tcase(onehot)\n\t\t"
        code = "\n\t\t".join([str(pow(2,self.CodeWidth))+"'d"+str(pow(2,i))+"  : binary = "+str(self.CodeWidth)+"'d"+str(i)+";" for i in range(pow(2,self.CodeWidth))])

        code += "\n\t\t//translate off\n\t\tdefault : binary = "+str(self.CodeWidth)+"'dx" \
                "\n\t\ttranslate on\n\tendcase\nend"
        self.body = "\n".join([module_dec, vector_dec, code])

    def get_body(self):
        if args.b2g:
            self.binary2gray()
        elif args.g2b:
            self.gray2binary()
        elif args.oh2b:
            
            self.onehot2binary()

    def __str__(self):

        return self.body

print(Encoder())