sld "GEN-1394 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-425", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1666", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-716", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1494", rating: "RECTIFIER PDU / 25 kW"]
f2cb = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1473", rating: "SHELTER LIGHTING / 9 kW"]
f3cb = breaker [label: "CB-300", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-762", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f3pnl = hub [label: "FD-949", rating: "3P+N"]
f3l1ld = load [label: "PNL-1444", rating: "SHELTER LIGHTING / 7 kW"]
f3l2ld = load [label: "PNL-1406", rating: "SHELTER LIGHTING / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
