sld "GEN-0935 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1688", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-323", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1pnl = hub [label: "FD-986", rating: "3P+N"]
f1l1cb = breaker [label: "CB-340", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1128", rating: "37 kW / COMP"]
f1l2cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1l2drv = vfd [label: "DRV-836", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1168", rating: "30 kW / PROC"]

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
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
