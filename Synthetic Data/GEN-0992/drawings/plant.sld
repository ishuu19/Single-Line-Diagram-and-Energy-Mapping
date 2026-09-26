sld "GEN-0992 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-467", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1662", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-320", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 210 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-713", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-719", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1412", rating: "AUXILIARY PANEL / 20 kW"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-366", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1191", rating: "12 kW / EF"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-333", rating: "MCCB / 20 A / 3P"]
f3l1m = motor [label: "MTR-1140", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
