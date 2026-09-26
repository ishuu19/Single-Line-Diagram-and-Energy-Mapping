sld "GEN-0741 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-445", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-776", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
busB = bus [label: "BUS-472", voltage: "208Y/120V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "320 kW"]
mcbB1 = breaker [label: "CB-396", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-713", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
tie = ats [label: "CB-346", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1401", rating: "CRITICAL BRANCH / 56 kW"]
f2cb = breaker [label: "CB-377", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 37 kW"]
f3cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-797", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1405", rating: "AUXILIARY PANEL / 24 kW"]

srcA1 -> mcbA1
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
busB -> f2cb [cable: "3#4/0 AWG"]
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
