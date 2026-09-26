sld "GEN-0591 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1627", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-350", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-367", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1171", rating: "52 kW / COMP"]
f2cb = breaker [label: "CB-372", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-703", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f2pnl = hub [label: "FD-970", rating: "3P+N"]
f2l1cb = breaker [label: "CB-377", rating: "MCCB / 125 A / 3P"]
f2l1m = motor [label: "MTR-1190", rating: "52 kW / COMP"]
f2l2cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f2l2drv = vfd [label: "DRV-802", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1184", rating: "48 kW / PROC"]
f3cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-797", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-395", rating: "MCCB / 80 A / 3P"]
f3l1m = motor [label: "MTR-1167", rating: "33 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
