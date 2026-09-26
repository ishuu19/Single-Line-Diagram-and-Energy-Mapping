sld "GEN-0427 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-452", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1678", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-349", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1437", rating: "PACKAGING PANEL / 19 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-350", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1138", rating: "18 kW / COND"]
f3cb = breaker [label: "CB-356", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1176", rating: "31 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
