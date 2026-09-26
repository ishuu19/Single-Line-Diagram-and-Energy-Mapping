sld "GEN-1032 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-490", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1658", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-353", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1121", rating: "23 kW / COND"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1419", rating: "DOCK PANEL / 25 kW"]
f3cb = breaker [label: "CB-338", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-769", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3pnl = hub [label: "FD-921", rating: "3P+N"]
f3l1ld = load [label: "PNL-1484", rating: "DOCK PANEL / 32 kW"]
f3l2cb = breaker [label: "CB-302", rating: "MCCB / 32 A / 3P"]
f3l2m = motor [label: "MTR-1118", rating: "13 kW / EF"]

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
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
