sld "GEN-0793 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-409", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1611", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-347", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-781", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1cb = breaker [label: "CB-334", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1145", rating: "16 kW / COMP"]
f1l2cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f1l2m = motor [label: "MTR-1184", rating: "36 kW / COMP"]
f2cb = breaker [label: "CB-373", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1444", rating: "CELLAR PANEL / 10 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
