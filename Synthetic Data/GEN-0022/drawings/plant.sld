sld "GEN-0022 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-468", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1653", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1pnl = hub [label: "FD-987", rating: "3P+N"]
f1l1cb = breaker [label: "CB-393", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1156", rating: "5 kW / EF"]
f1l2ld = load [label: "PNL-1493", rating: "REEFER RACK PANEL / 111 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2pnl = hub [label: "FD-922", rating: "3P+N"]
f2l1ld = load [label: "PNL-1426", rating: "YARD LIGHTING / 31 kW"]
f2l2ld = load [label: "PNL-1456", rating: "YARD LIGHTING / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
