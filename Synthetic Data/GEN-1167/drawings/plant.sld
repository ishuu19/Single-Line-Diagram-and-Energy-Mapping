sld "GEN-1167 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-473", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-372", rating: "MCCB / 320 A / 3P"]
f1l1drv = vfd [label: "DRV-828", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1152", rating: "65 kW / COMP"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2pnl = hub [label: "FD-997", rating: "3P+N"]
f2l1cb = breaker [label: "CB-367", rating: "MCCB / 200 A / 3P"]
f2l1drv = vfd [label: "DRV-863", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1139", rating: "51 kW / COMP"]
f2l2cb = breaker [label: "CB-353", rating: "MCCB / 100 A / 3P"]
f2l2m = motor [label: "MTR-1108", rating: "23 kW / COND"]
f3cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-708", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-378", rating: "MCCB / 125 A / 3P"]
f3l1m = motor [label: "MTR-1191", rating: "27 kW / COND"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
