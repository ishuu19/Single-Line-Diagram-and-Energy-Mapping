sld "GEN-0752 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-422", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1695", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
busB = bus [label: "BUS-494", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbB1 = breaker [label: "CB-325", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-720", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
tie = ats [label: "CB-392", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1439", rating: "AUXILIARY PANEL / 21 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1401", rating: "AUXILIARY PANEL / 21 kW"]
f3cb = breaker [label: "CB-393", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1418", rating: "AUXILIARY PANEL / 11 kW"]

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
