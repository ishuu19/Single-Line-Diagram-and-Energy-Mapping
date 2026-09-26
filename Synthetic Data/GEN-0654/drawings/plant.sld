sld "GEN-0654 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-441", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-754", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1pnl = hub [label: "FD-938", rating: "3P+N"]
f1l1cb = breaker [label: "CB-314", rating: "MCCB / 320 A / 3P"]
f1l1m = motor [label: "MTR-1187", rating: "151 kW / BLOW"]
f1l2ld = load [label: "PNL-1401", rating: "MCC AUXILIARY BOARD / 71 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
