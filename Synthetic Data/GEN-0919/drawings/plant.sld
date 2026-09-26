sld "GEN-0919 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-475", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1655", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-716", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1pnl = hub [label: "FD-922", rating: "3P+N"]
f1l1ld = load [label: "PNL-1410", rating: "UTILITY PANEL / 24 kW"]
f1l2cb = breaker [label: "CB-361", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1159", rating: "24 kW / COMP"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-349", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-836", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1170", rating: "33 kW / PROC"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-345", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1157", rating: "13 kW / EF"]

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
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
