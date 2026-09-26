sld "GEN-1118 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-406", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1651", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-386", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1pnl = hub [label: "FD-906", rating: "3P+N"]
f1l1ld = load [label: "PNL-1433", rating: "SHELTER LIGHTING / 8 kW"]
f1l2ld = load [label: "PNL-1428", rating: "RECTIFIER PDU / 50 kW"]

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
