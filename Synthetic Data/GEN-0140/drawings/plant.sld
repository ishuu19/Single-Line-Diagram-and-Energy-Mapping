sld "GEN-0140 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-452", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1655", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-307", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-708", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1pnl = hub [label: "FD-965", rating: "3P+N"]
f1l1cb = breaker [label: "CB-356", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1150", rating: "6 kW / EF"]
f1l2ld = load [label: "PNL-1438", rating: "DOCK LIGHTING / 19 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
