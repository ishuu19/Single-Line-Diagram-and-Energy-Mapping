sld "GEN-0384 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-414", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1685", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
busB = bus [label: "BUS-463", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1639", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-348", rating: "MCCB / 800 A / 3P"]
mctB1 = ct [label: "TA-747", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
tie = bus_tie [label: "CB-399", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1463", rating: "CRITICAL BRANCH / 30 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-759", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1469", rating: "WARD LIGHTING / 22 kW"]
f3cb = breaker [label: "CB-354", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
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
