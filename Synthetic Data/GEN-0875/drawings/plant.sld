sld "GEN-0875 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-423", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1630", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
busB = bus [label: "BUS-406", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "150 kW"]
mcbB1 = breaker [label: "CB-309", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
tie = ats [label: "CB-388", rating: "2000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "SHOP AUXILIARIES / 49 kW"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1491", rating: "SHOP AUXILIARIES / 40 kW"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-797", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1466", rating: "SHOP AUXILIARIES / 20 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
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
