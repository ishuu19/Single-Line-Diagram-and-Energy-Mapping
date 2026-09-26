sld "GEN-1544 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-357", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
busB = bus [label: "BUS-465", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbB1 = breaker [label: "CB-310", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-750", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
tie = ats [label: "CB-387", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1pnl = hub [label: "FD-983", rating: "3P+N"]
f1l1ld = load [label: "PNL-1466", rating: "SHELTER LIGHTING / 11 kW"]
f1l2ld = load [label: "PNL-1484", rating: "SHELTER LIGHTING / 8 kW"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "SHELTER LIGHTING / 4 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
