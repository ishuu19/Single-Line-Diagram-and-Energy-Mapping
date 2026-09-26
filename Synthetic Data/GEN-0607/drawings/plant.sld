sld "GEN-0607 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1609", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-343", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-764", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1pnl = hub [label: "FD-955", rating: "3P+N"]
f1l1cb = breaker [label: "CB-369", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1104", rating: "20 kW / COND"]
f1l2ld = load [label: "PNL-1478", rating: "DOCK PANEL / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
