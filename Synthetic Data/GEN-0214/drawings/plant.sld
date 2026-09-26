sld "GEN-0214 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1651", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
busB = bus [label: "BUS-429", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "750 kW"]
mcbB1 = breaker [label: "CB-319", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-719", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
tie = ats [label: "CB-372", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1488", rating: "ADMIN PANEL / 58 kW"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1479", rating: "AUXILIARY PANEL / 11 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1416", rating: "AUXILIARY PANEL / 11 kW"]

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
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
