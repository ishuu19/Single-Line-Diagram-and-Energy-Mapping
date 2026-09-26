sld "GEN-0076 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1648", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
srcA2 = utility [label: "6.6kV STANDBY", voltage: "6.6kV"]
txA2 = transformer_yd [label: "TX-1617", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-346", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-747", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1pnl = hub [label: "FD-946", rating: "3P+N"]
f1l1ld = load [label: "PNL-1419", rating: "DOSING PANEL / 39 kW"]
f1l2cb = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
f1l2drv = vfd [label: "DRV-881", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1126", rating: "71 kW / RWP"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
