sld "GEN-0823 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1643", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-394", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1pnl = hub [label: "FD-984", rating: "3P+N"]
f1l1ld = load [label: "PNL-1465", rating: "CONTROL PANEL / 21 kW"]
f1l2cb = breaker [label: "CB-323", rating: "MCCB / 40 A / 3P"]
f1l2m = motor [label: "MTR-1154", rating: "18 kW / RWP"]

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
mctA1 -> mpmA1
f1ct -> f1pm
