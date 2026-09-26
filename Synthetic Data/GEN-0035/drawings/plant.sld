sld "GEN-0035 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-442", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1650", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-311", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-894", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1169", rating: "54 kW / PROC"]
f2cb = breaker [label: "CB-346", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2pnl = hub [label: "FD-964", rating: "3P+N"]
f2l1cb = breaker [label: "CB-310", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-898", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1112", rating: "35 kW / PROC"]
f2l2ld = load [label: "PNL-1453", rating: "UTILITY PANEL / 30 kW"]
f3cb = breaker [label: "CB-351", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-717", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1422", rating: "UTILITY PANEL / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
