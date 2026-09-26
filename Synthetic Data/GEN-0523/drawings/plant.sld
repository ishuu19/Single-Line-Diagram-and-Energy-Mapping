sld "GEN-0523 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-438", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1690", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-352", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1103", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2pnl = hub [label: "FD-954", rating: "3P+N"]
f2l1ld = load [label: "PNL-1447", rating: "DOCK PANEL / 23 kW"]
f2l2cb = breaker [label: "CB-377", rating: "MCCB / 50 A / 3P"]
f2l2m = motor [label: "MTR-1137", rating: "22 kW / COND"]
f3cb = breaker [label: "CB-389", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-757", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-357", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1176", rating: "12 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
