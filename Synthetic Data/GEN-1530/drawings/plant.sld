sld "GEN-1530 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-445", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-379", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1475", rating: "DOCK PANEL / 15 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f2pnl = hub [label: "FD-968", rating: "3P+N"]
f2l1cb = breaker [label: "CB-325", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-816", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1176", rating: "61 kW / COMP"]
f2l2cb = breaker [label: "CB-398", rating: "MCCB / 40 A / 3P"]
f2l2m = motor [label: "MTR-1190", rating: "18 kW / COND"]
f3cb = breaker [label: "CB-372", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-770", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-389", rating: "MCCB / 20 A / 3P"]
f3l1m = motor [label: "MTR-1174", rating: "9 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
