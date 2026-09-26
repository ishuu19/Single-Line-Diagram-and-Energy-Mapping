sld "GEN-0649 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-448", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-355", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
busB = bus [label: "BUS-489", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1603", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-389", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-776", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
tie = bus_tie [label: "CB-372", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1406", rating: "MCC AUXILIARY BOARD / 72 kW"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-710", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1482", rating: "AUXILIARY PANEL / 395 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1475", rating: "AUXILIARY PANEL / 411 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
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
