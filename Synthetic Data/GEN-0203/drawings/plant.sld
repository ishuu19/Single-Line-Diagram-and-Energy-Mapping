sld "GEN-0203 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1645", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-336", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1pnl = hub [label: "FD-991", rating: "3P+N"]
f1l1ld = load [label: "PNL-1408", rating: "DOCK LIGHTING / 23 kW"]
f1l2ld = load [label: "PNL-1452", rating: "DOCK LIGHTING / 21 kW"]
f2cb = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-335", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1121", rating: "6 kW / EF"]
f3cb = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1437", rating: "SHORE POWER PANEL / 62 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
