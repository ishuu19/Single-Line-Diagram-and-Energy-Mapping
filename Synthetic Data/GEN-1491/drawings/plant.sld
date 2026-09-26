sld "GEN-1491 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1635", rating: "110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
busB = bus [label: "BUS-449", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbB1 = breaker [label: "CB-366", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-713", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
tie = ats [label: "CB-343", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1407", rating: "SHELTER LIGHTING / 10 kW"]
f3cb = breaker [label: "CB-373", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1427", rating: "SHELTER LIGHTING / 9 kW"]

srcA1 -> txA1
txA1 -> mcbA1
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
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
