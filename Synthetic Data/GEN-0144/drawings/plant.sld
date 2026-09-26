sld "GEN-0144 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-440", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1601", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-318", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1pnl = hub [label: "FD-973", rating: "3P+N"]
f1l1ld = load [label: "PNL-1432", rating: "COMMON AREA LIGHTING / 46 kW"]
f1l2ld = load [label: "PNL-1439", rating: "RISER PANEL / 48 kW"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2pnl = hub [label: "FD-916", rating: "3P+N"]
f2l1cb = breaker [label: "CB-336", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1168", rating: "8 kW / EF"]
f2l2cb = breaker [label: "CB-375", rating: "MCCB / 63 A / 3P"]
f2l2drv = vfd [label: "DRV-897", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1146", rating: "29 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
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
