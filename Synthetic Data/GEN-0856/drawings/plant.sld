sld "GEN-0856 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1626", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-398", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
busB = bus [label: "BUS-454", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbB1 = breaker [label: "CB-340", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-728", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
tie = ats [label: "CB-379", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1468", rating: "SHELTER LIGHTING / 11 kW"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-731", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "RECTIFIER PDU / 41 kW"]
f3cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-714", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1486", rating: "SHELTER LIGHTING / 8 kW"]

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
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
