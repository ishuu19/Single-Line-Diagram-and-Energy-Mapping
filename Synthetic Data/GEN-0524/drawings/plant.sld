sld "GEN-0524 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-337", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1406", rating: "REEFER RACK PANEL / 138 kW"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-764", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2pnl = hub [label: "FD-943", rating: "3P+N"]
f2l1cb = breaker [label: "CB-329", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1167", rating: "11 kW / EF"]
f2l2ld = load [label: "PNL-1489", rating: "REEFER RACK PANEL / 148 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
