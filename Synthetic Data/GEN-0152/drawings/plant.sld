sld "GEN-0152 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1636", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1pnl = hub [label: "FD-934", rating: "3P+N"]
f1l1ld = load [label: "PNL-1416", rating: "DOSING PANEL / 19 kW"]
f1l2cb = breaker [label: "CB-338", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-828", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1154", rating: "35 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
