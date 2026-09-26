sld "GEN-0388 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-450", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
busB = bus [label: "BUS-497", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbB1 = breaker [label: "CB-380", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-770", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
tie = ats [label: "CB-325", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1434", rating: "DOCK PANEL / 15 kW"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "AUXILIARY PANEL / 10 kW"]
f3cb = breaker [label: "CB-340", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-737", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1465", rating: "AUXILIARY PANEL / 7 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
