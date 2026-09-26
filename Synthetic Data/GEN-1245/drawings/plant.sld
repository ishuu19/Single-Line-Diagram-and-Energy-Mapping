sld "GEN-1245 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-494", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1634", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 104 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-353", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-752", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1pnl = hub [label: "FD-990", rating: "3P+N"]
f1l1cb = breaker [label: "CB-325", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-809", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1114", rating: "22 kW / AHU"]
f1l2cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f1l2drv = vfd [label: "DRV-867", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1196", rating: "33 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
