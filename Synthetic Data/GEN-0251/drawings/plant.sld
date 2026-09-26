sld "GEN-0251 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-436", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1667", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-737", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1pnl = hub [label: "FD-971", rating: "3P+N"]
f1l1cb = breaker [label: "CB-395", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1148", rating: "5 kW / EF"]
f1l2cb = breaker [label: "CB-358", rating: "MCCB / 125 A / 3P"]
f1l2drv = vfd [label: "DRV-835", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1187", rating: "60 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
