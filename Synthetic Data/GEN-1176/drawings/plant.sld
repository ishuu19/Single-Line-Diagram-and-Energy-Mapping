sld "GEN-1176 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-422", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1616", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-385", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-749", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1pnl = hub [label: "FD-981", rating: "3P+N"]
f1l1ld = load [label: "PNL-1467", rating: "COMMON AREA LIGHTING / 43 kW"]
f1l2ld = load [label: "PNL-1410", rating: "COMMON AREA LIGHTING / 31 kW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2pnl = hub [label: "FD-939", rating: "3P+N"]
f2l1cb = breaker [label: "CB-366", rating: "MCCB / 25 A / 3P"]
f2l1drv = vfd [label: "DRV-873", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1171", rating: "11 kW / CRAC"]
f2l2ld = load [label: "PNL-1406", rating: "RISER PANEL / 93 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
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
