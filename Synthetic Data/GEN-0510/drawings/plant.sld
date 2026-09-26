sld "GEN-0510 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-434", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1644", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-335", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
busB = bus [label: "BUS-499", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "500 kW"]
mcbB1 = breaker [label: "CB-350", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-700", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
tie = ats [label: "CB-318", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1pnl = hub [label: "FD-950", rating: "3P+N"]
f1l1ld = load [label: "PNL-1458", rating: "AUXILIARY PANEL / 40 kW"]
f1l2ld = load [label: "PNL-1484", rating: "AUXILIARY PANEL / 26 kW"]
f1x = capacitor_bank [label: "CAP-672", rating: "107 kVAR"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2pnl = hub [label: "FD-970", rating: "3P+N"]
f2l1ld = load [label: "PNL-1459", rating: "SHOP LIGHTING / 27 kW"]
f2l2ld = load [label: "PNL-1445", rating: "AUXILIARY PANEL / 39 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
f1pnl -> f1x
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
