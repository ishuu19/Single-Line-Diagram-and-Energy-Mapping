sld "GEN-0161 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-438", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1633", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1pnl = hub [label: "FD-984", rating: "3P+N"]
f1l1cb = breaker [label: "CB-368", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-803", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1129", rating: "25 kW / AHU"]
f1l2cb = breaker [label: "CB-373", rating: "MCCB / 40 A / 3P"]
f1l2drv = vfd [label: "DRV-825", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1131", rating: "17 kW / AHU"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f2pnl = hub [label: "FD-996", rating: "3P+N"]
f2l1cb = breaker [label: "CB-387", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-822", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1149", rating: "19 kW / AHU"]
f2l2ld = load [label: "PNL-1475", rating: "HOUSE PANEL / 59 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
