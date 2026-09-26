sld "GEN-1355 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-465", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
busB = bus [label: "BUS-493", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "100 kW"]
mcbB1 = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
mctB1 = ct [label: "TA-781", rating: "3 CTs / 160/5 A"]
mpmB1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
tie = ats [label: "CB-315", rating: "1000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-786", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1452", rating: "SHELTER LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1498", rating: "AUXILIARY PANEL / 14 kW"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1432", rating: "RECTIFIER PDU / 36 kW"]

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
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
