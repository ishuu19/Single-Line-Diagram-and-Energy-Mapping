sld "GEN-0493 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-463", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1666", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-767", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-340", rating: "MCCB / 160 A / 3P"]
f1l1m = motor [label: "MTR-1140", rating: "40 kW / COMP"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "SHOP LIGHTING / 17 kW"]
f3cb = breaker [label: "CB-344", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-371", rating: "MCCB / 200 A / 3P"]
f3l1m = motor [label: "MTR-1112", rating: "42 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
