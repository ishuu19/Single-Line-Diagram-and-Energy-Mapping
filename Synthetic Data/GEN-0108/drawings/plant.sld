sld "GEN-0108 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1686", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
busB = bus [label: "BUS-411", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "400 kW"]
mcbB1 = breaker [label: "CB-387", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-726", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
tie = ats [label: "CB-331", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1454", rating: "AUXILIARY PANEL / 83 kW"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1468", rating: "SHOP LIGHTING / 25 kW"]
f3cb = breaker [label: "CB-363", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1476", rating: "SHOP LIGHTING / 24 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
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
