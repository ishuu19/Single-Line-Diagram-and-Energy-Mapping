sld "GEN-0706 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-422", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1627", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-356", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-334", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1116", rating: "9 kW / EF"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2pnl = hub [label: "FD-959", rating: "3P+N"]
f2l1cb = breaker [label: "CB-312", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1197", rating: "6 kW / EF"]
f2l2ld = load [label: "PNL-1415", rating: "SHORE POWER PANEL / 40 kW"]
f3cb = breaker [label: "CB-358", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-708", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-320", rating: "MCCB / 16 A / 3P"]
f3l1m = motor [label: "MTR-1111", rating: "6 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
