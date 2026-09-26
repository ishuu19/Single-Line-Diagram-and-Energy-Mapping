sld "GEN-0091 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1614", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-311", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1pnl = hub [label: "FD-904", rating: "3P+N"]
f1l1ld = load [label: "PNL-1462", rating: "SHOP LIGHTING / 21 kW"]
f1l2ld = load [label: "PNL-1487", rating: "SHOP LIGHTING / 18 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
