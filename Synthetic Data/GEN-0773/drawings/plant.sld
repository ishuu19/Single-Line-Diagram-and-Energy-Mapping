sld "GEN-0773 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1607", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-318", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-702", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1pnl = hub [label: "FD-976", rating: "3P+N"]
f1l1cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-854", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1172", rating: "25 kW / BLOW"]
f1l2ld = load [label: "PNL-1445", rating: "DOSING PANEL / 40 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
