sld "GEN-0908 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-452", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1631", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1cb = breaker [label: "CB-368", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "YARD LIGHTING / 30 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2pnl = hub [label: "FD-912", rating: "3P+N"]
f2l1ld = load [label: "PNL-1406", rating: "YARD LIGHTING / 34 kW"]
f2l2ld = load [label: "PNL-1473", rating: "YARD LIGHTING / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
