sld "GEN-0605 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-423", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1665", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-373", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 443 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-374", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-729", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-767", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1pnl = hub [label: "FD-976", rating: "3P+N"]
f1l1ld = load [label: "PNL-1405", rating: "GROW LIGHTING / 31 kW"]
f1l2ld = load [label: "PNL-1458", rating: "GROW LIGHTING / 69 kW"]
f2cb = breaker [label: "CB-341", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-350", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-816", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1161", rating: "14 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
