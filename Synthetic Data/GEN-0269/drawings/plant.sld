sld "GEN-0269 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-475", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-386", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1pnl = hub [label: "FD-985", rating: "3P+N"]
f1l1cb = breaker [label: "CB-338", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1142", rating: "15 kW / EF"]
f1l2cb = breaker [label: "CB-399", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1177", rating: "21 kW / COND"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-365", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1182", rating: "55 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
