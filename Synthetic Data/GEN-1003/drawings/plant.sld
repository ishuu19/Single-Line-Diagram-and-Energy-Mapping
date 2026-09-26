sld "GEN-1003 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-454", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1614", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-368", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1189", rating: "14 kW / EF"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2pnl = hub [label: "FD-980", rating: "3P+N"]
f2l1cb = breaker [label: "CB-360", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1134", rating: "19 kW / COMP"]
f2l2cb = breaker [label: "CB-387", rating: "MCCB / 40 A / 3P"]
f2l2m = motor [label: "MTR-1159", rating: "22 kW / COMP"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1453", rating: "UTILITY PANEL / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
