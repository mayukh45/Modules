from templates import pipe_body_template
import argparse
parser = argparse.ArgumentParser()

parser.add_argument("-isb", help="input skid buffer", action="store_true")
parser.add_argument("-wid", help="width of data", type=int)
args = parser.parse_args()


class Pipe:
    def __init__(self):
        self.Width = args.wid
        self.body = None

    def pipe(self):
        register = "reg  rd_valid;\nreg  ["+str(self.Width-1)+":0] rd_data;\nwire  wr_ready;"

        code = "assign wr_ready = rd_ready || !rd_valid;\n" \
               "always @(posedge clk or negedge rst) begin\n\tif (!rst) begin\n\t\t" \
               "rd_valid <= 1'b0;\n\tend else begin\n\t\t" \
               "if (wr_ready) begin\n\t\t\t" \
               "rd_valid <= wr_valid;\n\t\t" \
               "end\n\t" \
               "end\nend\n"
        code += "always @(posedge clk) begin\n\tif (wr_ready && wr_valid) begin" \
                "\n\t\trd_data["+str(self.Width-1)+":0] <= wr_data["+str(self.Width-1)+":0];" \
                "\n\tend\nend"

        self.body = self.body.replace("//PIPE", code)

    def skid(self):
        register = "reg wr_ready;\nreg skid_flop_wr_ready;\nreg skid_flop_wr_valid;\nreg ["+str(self.Width-1)+":0] skid_flop_wr_data;"

        code = "always @(posedge clk or negedge rst) begin\n\tif (!rst) begin" \
               "\n\n\twr_ready <= 1'b1;\n\t\tskid_flop_wr_ready <= 1'b1;" \
               "\n\tend else begin" \
               "\n\t\twr_ready <= rd_ready;\n\t\tskid_flop_wr_ready <= rd_ready;" \
               "\n\tend\nend\n"

        code += "always @(posedge clk or negedge rst) begin\n\t" \
                "if (!rst) begin\n\t\tskid_flop_wr_valid <= 1'b0;" \
                "\n\tend else begin\n\t\tif (skid_flop_wr_ready) begin" \
                "\n\t\t\tskid_flop_wr_valid <= wr_valid;\n\t\tend\n\tend" \
                "\nend\nassign rd_valid = (skid_flop_wr_ready) ? wr_valid : skid_flop_wr_valid;\n"

        code += "always @(posedge clk) begin\n\t" \
                "if (skid_flop_wr_ready & wr_valid) begin\n\t\tskid_flop_wr_data["+str(self.Width-1)+":0] <= wr_data["+str(self.Width-1)+":0];" \
                "\n\tend\nend\nassign rd_data["+str(self.Width-1)+":0] = (skid_flop_wr_ready) ? wr_data["+str(self.Width-1)+":0] : skid_flop_wr_data["+str(self.Width-1)+":0];\n"

        self.body = self.body.replace("//SKID", code)
        self.body = self.body.replace("SKID_REGISTERS" , register)

    def get_body(self):
        self.body = pipe_body_template
        self.body = self.body.replace("WIDEWIDTH - 1", str(self.Width -1))
        self.pipe()
        if args.isb:
            self.skid()

    def __str__(self):
        self.get_body()
        return self.body

print(Pipe())


