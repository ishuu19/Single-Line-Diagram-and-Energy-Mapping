sld "GEN-0362 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-428", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1671", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-319", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-737", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1pnl = hub [label: "FD-954", rating: "3P+N"]
f1l1ld = load [label: "PNL-1413", rating: "CONTROL PANEL / 25 kW"]
f1l2cb = breaker [label: "CB-329", rating: "MCCB / 50 A / 3P"]
f1l2m = motor [label: "MTR-1174", rating: "28 kW / RWP"]
f2cb = breaker [label: "CB-375", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2pnl = hub [label: "FD-900", rating: "3P+N"]
f2l1ld = load [label: "PNL-1422", rating: "AUXILIARY PANEL / 10 kW"]
f2l2ld = load [label: "PNL-1488", rating: "GROW LIGHTING / 45 kW"]
f3cb = breaker [label: "CB-385", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f3pnl = hub [label: "FD-958", rating: "3P+N"]
f3l1ld = load [label: "PNL-1494", rating: "AUXILIARY PANEL / 7 kW"]
f3l2ld = load [label: "PNL-1436", rating: "CONTROL PANEL / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
