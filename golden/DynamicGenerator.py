#=============================================================================================
# Class Dynamic Generator - The chief functionality of this class to be able to take a piece
# of code as string and able to run it as any other python code and return the output string
# We achieve this today by writing into py file and getting another output file and write
# back to main file.
# TODO: In future, find out a better way to achieve this.
#=============================================================================================

import os
from datetime import datetime   #### import datatime
class DynamicGenerator:
    """
    body_data -> actual template means if we go for LruArbiter module, we are passing body template of LruArbiter module.
    dic -> dictonary of variable we are using in Module, it is used when we are creating temporary python file.
    """
    def __init__(self,dic,body_data):
        self.body_data=body_data
        self.dic=dic
        self.temp_py_file=""
        self.temp_txt_file=""

    def parse_body(self):
        main_body=""
        split_body=self.body_data.split("/f_f/")    # /f_f/ is an expression, based on this we are splitinng the body into a list.

        for b in range(len(split_body)):
            """
            if the index is odd then we process odd position code, dumped into pyhton code then process into text file.
            otherwise just concat as string handleing

            """
            if b%2==0:
                main_body+=split_body[b]
            else:
                main_body+=self.temporary_pyfile(self.dic,split_body[b])
        return main_body


    def temporary_pyfile(self,dic,body_data):
        time_current=datetime.now().strftime('%H_%M_%S')
        code=""
        for x,y in dic.items():
            code+=x+"="+str(y)+"\n" ## here we process variable to temp python
        code+="\n"+body_data+"\nprint(code)"
        self.temp_py_file="temp_"+time_current+".py"    # creting temporay pyhton based on time to handle mutithreading
        with open(self.temp_py_file,'w') as f:
            f.write(code)
            f.close()
        self.temp_txt_file="output_"+time_current+".txt"    # creating temporary text file from where we retrive output and processed to verilog file.
        cmd="python "+self.temp_py_file
        os.system(cmd+'>'+self.temp_txt_file) # running python file using os.system
        return self.temporary_txtfile()

    """
    method for retrive output from temporary text file, and copy into body
    """
    def temporary_txtfile(self):
        lines=""
        fp=open(self.temp_txt_file,'r')
        for p in fp:
            lines+=p
        return lines

    """
    after processing all operation removing all temporary file
    """
    def silentremove(self):
        try:
            # os.remove(self.temp_py_file)
            # os.remove(self.temp_txt_file)
            os.system("rm temp_*")
            os.system("rm output_*")
        except:
            raise Exception("file not found")
