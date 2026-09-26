sld "GEN-1519 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-438", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1637", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-396", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
busB = bus [label: "BUS-446", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbB1 = breaker [label: "CB-351", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
tie = ats [label: "CB-344", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-774", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1412", rating: "CRITICAL BRANCH / 62 kW"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "CRITICAL BRANCH / 32 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
