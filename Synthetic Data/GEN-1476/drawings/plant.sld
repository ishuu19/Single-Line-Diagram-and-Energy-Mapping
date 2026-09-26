sld "GEN-1476 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-463", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-331", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-792", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
busB = bus [label: "BUS-464", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1675", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-305", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-735", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
tie = bus_tie [label: "CB-359", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1449", rating: "AUXILIARY PANEL / 24 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1400", rating: "AUXILIARY PANEL / 82 kW"]
f3cb = breaker [label: "CB-313", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1416", rating: "DOCK PANEL / 23 kW"]

srcA1 -> mcbA1
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
busB -> f2cb [cable: "3#1/0 AWG"]
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
