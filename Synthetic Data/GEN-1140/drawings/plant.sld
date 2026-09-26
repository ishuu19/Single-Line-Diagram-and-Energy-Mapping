sld "GEN-1140 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-421", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1687", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1460", rating: "UTILITY PANEL / 15 kW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2pnl = hub [label: "FD-902", rating: "3P+N"]
f2l1cb = breaker [label: "CB-348", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1117", rating: "19 kW / COMP"]
f2l2cb = breaker [label: "CB-355", rating: "MCCB / 125 A / 3P"]
f2l2drv = vfd [label: "DRV-878", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1188", rating: "50 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
