sld "GEN-1488 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-471", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1677", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1pnl = hub [label: "FD-989", rating: "3P+N"]
f1l1ld = load [label: "PNL-1488", rating: "UTILITY PANEL / 22 kW"]
f1l2ld = load [label: "PNL-1415", rating: "AUXILIARY PANEL / 46 kW"]
f2cb = breaker [label: "CB-325", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-323", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1185", rating: "15 kW / EF"]
f3cb = breaker [label: "CB-343", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3pnl = hub [label: "FD-925", rating: "3P+N"]
f3l1ld = load [label: "PNL-1493", rating: "AUXILIARY PANEL / 36 kW"]
f3l2cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f3l2m = motor [label: "MTR-1124", rating: "33 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
