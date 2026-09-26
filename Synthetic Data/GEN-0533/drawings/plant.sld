sld "GEN-0533 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-433", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1641", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
busB = bus [label: "BUS-428", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1675", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-392", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-701", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
tie = bus_tie [label: "CB-368", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1435", rating: "ACADEMIC BLOCK PANEL / 84 kW"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1433", rating: "SITE LIGHTING / 21 kW"]
f3cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1405", rating: "ACADEMIC BLOCK PANEL / 66 kW"]

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
