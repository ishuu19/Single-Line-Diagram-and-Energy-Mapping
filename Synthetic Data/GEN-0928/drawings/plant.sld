sld "GEN-0928 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-419", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
busB = bus [label: "BUS-448", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbB1 = breaker [label: "CB-325", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
tie = ats [label: "CB-323", rating: "2000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1414", rating: "AUXILIARY PANEL / 13 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2pnl = hub [label: "FD-918", rating: "3P+N"]
f2l1ld = load [label: "PNL-1462", rating: "AUXILIARY PANEL / 14 kW"]
f2l2ld = load [label: "PNL-1413", rating: "AUXILIARY PANEL / 8 kW"]
f3cb = breaker [label: "CB-395", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1412", rating: "SHELTER LIGHTING / 4 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
