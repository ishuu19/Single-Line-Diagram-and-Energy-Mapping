sld "GEN-0965 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-466", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1618", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1pnl = hub [label: "FD-960", rating: "3P+N"]
f1l1ld = load [label: "PNL-1496", rating: "AUXILIARY PANEL / 71 kW"]
f1l2ld = load [label: "PNL-1425", rating: "DOCK PANEL / 17 kW"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1443", rating: "DOCK PANEL / 19 kW"]
f3cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f3pnl = hub [label: "FD-999", rating: "3P+N"]
f3l1cb = breaker [label: "CB-307", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-832", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1141", rating: "37 kW / COMP"]
f3l2cb = breaker [label: "CB-331", rating: "MCCB / 16 A / 3P"]
f3l2m = motor [label: "MTR-1194", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
