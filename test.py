a = {"A": {"B" : {"c":3}}}
temp = a.copy()
temp = a["A"]["B"] = {2:"negro"}
print(a)