sld "GEN-0658 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1652", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
busB = bus [label: "BUS-422", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1000 kW"]
mcbB1 = breaker [label: "CB-305", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-763", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
tie = ats [label: "CB-386", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1486", rating: "CRITICAL BRANCH / 31 kW"]
f2cb = breaker [label: "CB-332", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "WARD LIGHTING / 28 kW"]
f3cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1423", rating: "WARD LIGHTING / 28 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
