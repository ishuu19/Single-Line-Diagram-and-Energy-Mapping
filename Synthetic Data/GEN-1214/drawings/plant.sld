sld "GEN-1214 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-490", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1647", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1pnl = hub [label: "FD-916", rating: "3P+N"]
f1l1cb = breaker [label: "CB-392", rating: "MCCB / 160 A / 3P"]
f1l1m = motor [label: "MTR-1190", rating: "77 kW / BLOW"]
f1l2cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f1l2m = motor [label: "MTR-1135", rating: "137 kW / BLOW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2pnl = hub [label: "FD-993", rating: "3P+N"]
f2l1ld = load [label: "PNL-1416", rating: "MCC AUXILIARY BOARD / 75 kW"]
f2l2ld = load [label: "PNL-1476", rating: "MCC AUXILIARY BOARD / 69 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
