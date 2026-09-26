sld "GEN-0841 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-449", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1693", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
busB = bus [label: "BUS-436", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbB1 = breaker [label: "CB-308", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-796", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
tie = ats [label: "CB-378", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1414", rating: "SHORE POWER PANEL / 61 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1453", rating: "SHORE POWER PANEL / 76 kW"]
f3cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1492", rating: "AUXILIARY PANEL / 14 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
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
