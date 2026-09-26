sld "GEN-0276 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1633", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1pnl = hub [label: "FD-997", rating: "3P+N"]
f1l1cb = breaker [label: "CB-303", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1160", rating: "13 kW / EF"]
f1l2ld = load [label: "PNL-1442", rating: "ADMIN PANEL / 41 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-720", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "ADMIN PANEL / 67 kW"]
f3cb = breaker [label: "CB-313", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-784", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-340", rating: "MCCB / 16 A / 3P"]
f3l1m = motor [label: "MTR-1142", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
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
