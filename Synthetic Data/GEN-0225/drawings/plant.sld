sld "GEN-0225 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-408", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1632", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
busB = bus [label: "BUS-455", voltage: "208Y/120V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "130 kW"]
mcbB1 = breaker [label: "CB-399", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-776", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
tie = ats [label: "CB-306", rating: "400 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "AUXILIARY PANEL / 18 kW"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1482", rating: "AUXILIARY PANEL / 20 kW"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1486", rating: "TENANT PANEL / 93 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
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
