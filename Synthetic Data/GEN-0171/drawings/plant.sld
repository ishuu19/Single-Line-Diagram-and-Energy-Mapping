sld "GEN-0171 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1613", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-343", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "500 kW"]
mcbA2 = breaker [label: "CB-380", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-746", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1429", rating: "DOCK PANEL / 15 kW"]
f2cb = breaker [label: "CB-330", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-742", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2pnl = hub [label: "FD-984", rating: "3P+N"]
f2l1ld = load [label: "PNL-1428", rating: "DOCK PANEL / 21 kW"]
f2l2ld = load [label: "PNL-1469", rating: "DOCK PANEL / 28 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
