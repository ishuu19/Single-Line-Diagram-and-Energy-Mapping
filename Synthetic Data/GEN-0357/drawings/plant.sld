sld "GEN-0357 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-449", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-742", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1409", rating: "CLASSROOM LIGHTING / 44 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f2pnl = hub [label: "FD-966", rating: "3P+N"]
f2l1ld = load [label: "PNL-1436", rating: "ADMIN PANEL / 66 kW"]
f2l2cb = breaker [label: "CB-374", rating: "MCCB / 25 A / 3P"]
f2l2m = motor [label: "MTR-1157", rating: "12 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
