sld "GEN-1044 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-420", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-331", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1163", rating: "14 kW / EF"]
f2cb = breaker [label: "CB-371", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2pnl = hub [label: "FD-925", rating: "3P+N"]
f2l1cb = breaker [label: "CB-352", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1191", rating: "14 kW / EF"]
f2l2ld = load [label: "PNL-1431", rating: "REEFER RACK PANEL / 131 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
