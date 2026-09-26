sld "GEN-0375 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1pnl = hub [label: "FD-979", rating: "3P+N"]
f1l1cb = breaker [label: "CB-364", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1118", rating: "23 kW / COND"]
f1l2cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1137", rating: "27 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
