sld "GEN-0630 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-475", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1607", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-303", rating: "MCCB / 25 A / 3P"]
f1l1drv = vfd [label: "DRV-868", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1139", rating: "11 kW / EF"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1442", rating: "GROW LIGHTING / 60 kW"]
f3cb = breaker [label: "CB-346", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f3pnl = hub [label: "FD-964", rating: "3P+N"]
f3l1ld = load [label: "PNL-1460", rating: "GROW LIGHTING / 40 kW"]
f3l2cb = breaker [label: "CB-394", rating: "MCCB / 25 A / 3P"]
f3l2drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1132", rating: "11 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
