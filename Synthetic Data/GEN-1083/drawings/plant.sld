sld "GEN-1083 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1646", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-764", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1pnl = hub [label: "FD-985", rating: "3P+N"]
f1l1cb = breaker [label: "CB-367", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1155", rating: "24 kW / COND"]
f1l2cb = breaker [label: "CB-392", rating: "MCCB / 200 A / 3P"]
f1l2drv = vfd [label: "DRV-870", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1174", rating: "86 kW / COMP"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-347", rating: "MCCB / 80 A / 3P"]
f2l1m = motor [label: "MTR-1114", rating: "32 kW / COND"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-782", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1413", rating: "DOCK PANEL / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
