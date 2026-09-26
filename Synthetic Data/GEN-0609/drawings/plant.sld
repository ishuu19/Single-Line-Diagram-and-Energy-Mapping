sld "GEN-0609 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-413", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1698", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-742", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-705", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1pnl = hub [label: "FD-987", rating: "3P+N"]
f1l1ld = load [label: "PNL-1471", rating: "DOCK LIGHTING / 24 kW"]
f1l2ld = load [label: "PNL-1405", rating: "DOCK LIGHTING / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
