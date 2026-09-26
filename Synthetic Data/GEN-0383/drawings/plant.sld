sld "GEN-0383 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-437", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-346", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-767", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-379", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1137", rating: "24 kW / COMP"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f2pnl = hub [label: "FD-922", rating: "3P+N"]
f2l1ld = load [label: "PNL-1409", rating: "SHOP LIGHTING / 27 kW"]
f2l2cb = breaker [label: "CB-389", rating: "MCCB / 50 A / 3P"]
f2l2m = motor [label: "MTR-1196", rating: "23 kW / COMP"]
f3cb = breaker [label: "CB-330", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-742", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-365", rating: "MCCB / 125 A / 3P"]
f3l1drv = vfd [label: "DRV-854", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1163", rating: "54 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
