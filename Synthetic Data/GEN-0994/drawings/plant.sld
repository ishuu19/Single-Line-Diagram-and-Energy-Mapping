sld "GEN-0994 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-432", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-331", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_dy [label: "TX-1622", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-326", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-766", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "DOSING PANEL / 35 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1439", rating: "AUXILIARY PANEL / 44 kW"]
f3cb = breaker [label: "CB-330", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-762", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f3pnl = hub [label: "FD-980", rating: "3P+N"]
f3l1ld = load [label: "PNL-1470", rating: "DOSING PANEL / 31 kW"]
f3l2ld = load [label: "PNL-1425", rating: "AUXILIARY PANEL / 39 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
