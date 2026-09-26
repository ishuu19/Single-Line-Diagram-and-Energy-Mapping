sld "GEN-0141 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-397", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1pnl = hub [label: "FD-962", rating: "3P+N"]
f1l1cb = breaker [label: "CB-331", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1197", rating: "6 kW / EF"]
f1l2cb = breaker [label: "CB-310", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1167", rating: "15 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
