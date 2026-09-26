sld "GEN-0662 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1pnl = hub [label: "FD-968", rating: "3P+N"]
f1l1ld = load [label: "PNL-1427", rating: "DOCK PANEL / 26 kW"]
f1l2ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 15 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2pnl = hub [label: "FD-984", rating: "3P+N"]
f2l1ld = load [label: "PNL-1474", rating: "AUXILIARY PANEL / 5 kW"]
f2l2ld = load [label: "PNL-1497", rating: "DOCK PANEL / 18 kW"]
f3cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-730", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f3pnl = hub [label: "FD-978", rating: "3P+N"]
f3l1cb = breaker [label: "CB-339", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1129", rating: "15 kW / COND"]
f3l2ld = load [label: "PNL-1400", rating: "AUXILIARY PANEL / 71 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
