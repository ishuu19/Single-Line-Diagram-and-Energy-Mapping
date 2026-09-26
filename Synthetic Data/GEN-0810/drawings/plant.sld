sld "GEN-0810 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-446", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1682", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-381", rating: "MCCB / 200 A / 3P"]
f1l1m = motor [label: "MTR-1173", rating: "42 kW / COMP"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1463", rating: "PACKAGING PANEL / 11 kW"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1447", rating: "PACKAGING PANEL / 27 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
