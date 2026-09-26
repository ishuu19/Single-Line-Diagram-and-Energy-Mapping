sld "GEN-0103 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-431", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1691", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-318", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1663", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-386", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-329", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1176", rating: "21 kW / COMP"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-776", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2pnl = hub [label: "FD-962", rating: "3P+N"]
f2l1cb = breaker [label: "CB-319", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-809", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1135", rating: "41 kW / PROC"]
f2l2cb = breaker [label: "CB-340", rating: "MCCB / 40 A / 3P"]
f2l2m = motor [label: "MTR-1159", rating: "23 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
