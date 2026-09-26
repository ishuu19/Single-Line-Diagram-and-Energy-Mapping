sld "GEN-0294 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1689", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-301", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1467", rating: "HOUSE PANEL / 39 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2pnl = hub [label: "FD-933", rating: "3P+N"]
f2l1ld = load [label: "PNL-1424", rating: "HOUSE PANEL / 63 kW"]
f2l2cb = breaker [label: "CB-344", rating: "MCCB / 50 A / 3P"]
f2l2drv = vfd [label: "DRV-872", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1131", rating: "24 kW / AHU"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-746", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1463", rating: "SALES FLOOR LIGHTING / 40 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
