sld "GEN-0671 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-484", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1630", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
busB = bus [label: "BUS-406", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "150 kW"]
mcbB1 = breaker [label: "CB-300", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-720", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
tie = ats [label: "CB-344", rating: "2000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1pnl = hub [label: "FD-994", rating: "3P+N"]
f1l1cb = breaker [label: "CB-301", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1186", rating: "13 kW / CRAC"]
f1l2ld = load [label: "PNL-1449", rating: "SHELTER LIGHTING / 6 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "RECTIFIER PDU / 37 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
