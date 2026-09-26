sld "GEN-0643 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1652", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1pnl = hub [label: "FD-979", rating: "3P+N"]
f1l1cb = breaker [label: "CB-363", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1198", rating: "6 kW / EF"]
f1l2cb = breaker [label: "CB-396", rating: "MCCB / 32 A / 3P"]
f1l2drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1132", rating: "14 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
