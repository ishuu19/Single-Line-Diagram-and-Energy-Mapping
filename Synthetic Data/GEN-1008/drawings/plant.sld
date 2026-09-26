sld "GEN-1008 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-424", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1669", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 126 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-390", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-755", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1409", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1406", rating: "AUXILIARY PANEL / 19 kW"]
f3cb = breaker [label: "CB-346", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3pnl = hub [label: "FD-953", rating: "3P+N"]
f3l1ld = load [label: "PNL-1467", rating: "AUXILIARY PANEL / 20 kW"]
f3l2ld = load [label: "PNL-1420", rating: "AUXILIARY PANEL / 10 kW"]

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
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
