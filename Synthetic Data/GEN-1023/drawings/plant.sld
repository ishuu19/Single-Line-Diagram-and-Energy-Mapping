sld "GEN-1023 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-415", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
busB = bus [label: "BUS-473", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1648", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-752", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
tie = bus_tie [label: "CB-365", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1429", rating: "RECTIFIER PDU / 52 kW"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1451", rating: "AUXILIARY PANEL / 15 kW"]
f3cb = breaker [label: "CB-360", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1437", rating: "SHELTER LIGHTING / 4 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
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
