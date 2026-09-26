sld "GEN-0694 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-452", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1678", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-775", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-320", rating: "MCCB / 20 A / 3P"]
f1l1drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1113", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-751", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1429", rating: "CONTROL PANEL / 23 kW"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-733", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f3pnl = hub [label: "FD-941", rating: "3P+N"]
f3l1cb = breaker [label: "CB-385", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1102", rating: "14 kW / RWP"]
f3l2ld = load [label: "PNL-1420", rating: "GROW LIGHTING / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
