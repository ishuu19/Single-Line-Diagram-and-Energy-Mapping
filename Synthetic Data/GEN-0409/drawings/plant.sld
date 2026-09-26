sld "GEN-0409 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
busB = bus [label: "BUS-443", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "400 kW"]
mcbB1 = breaker [label: "CB-370", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-784", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
tie = ats [label: "CB-363", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1420", rating: "RECTIFIER PDU / 46 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 19 kW"]
f3cb = breaker [label: "CB-392", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-755", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1483", rating: "RECTIFIER PDU / 36 kW"]

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
busA -> f2cb [cable: "3#2/0 AWG"]
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
