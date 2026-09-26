sld "GEN-0936 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-469", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1690", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-355", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1ld = load [label: "PNL-1434", rating: "UTILITY PANEL / 16 kW"]
f1l2cb = breaker [label: "CB-382", rating: "MCCB / 20 A / 3P"]
f1l2m = motor [label: "MTR-1145", rating: "11 kW / EF"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2pnl = hub [label: "FD-962", rating: "3P+N"]
f2l1cb = breaker [label: "CB-314", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-878", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1116", rating: "27 kW / PROC"]
f2l2cb = breaker [label: "CB-376", rating: "MCCB / 16 A / 3P"]
f2l2m = motor [label: "MTR-1180", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
