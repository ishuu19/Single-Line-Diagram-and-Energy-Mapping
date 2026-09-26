sld "GEN-1058 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-437", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1600", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-349", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
busB = bus [label: "BUS-446", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbB1 = breaker [label: "CB-376", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
tie = ats [label: "CB-302", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1446", rating: "SHELTER LIGHTING / 6 kW"]
f2cb = breaker [label: "CB-387", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1492", rating: "AUXILIARY PANEL / 17 kW"]
f3cb = breaker [label: "CB-340", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 17 kW"]

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
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
