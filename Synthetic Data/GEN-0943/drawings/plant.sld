sld "GEN-0943 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-422", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1pnl = hub [label: "FD-974", rating: "3P+N"]
f1l1cb = breaker [label: "CB-379", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1127", rating: "12 kW / EF"]
f1l2cb = breaker [label: "CB-311", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1105", rating: "11 kW / EF"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-770", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1457", rating: "CLASSROOM LIGHTING / 27 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
