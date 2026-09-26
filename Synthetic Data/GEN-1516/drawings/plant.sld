sld "GEN-1516 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-437", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1654", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_yd [label: "TX-1655", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-309", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-700", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-754", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1pnl = hub [label: "FD-968", rating: "3P+N"]
f1l1ld = load [label: "PNL-1478", rating: "CLASSROOM LIGHTING / 41 kW"]
f1l2cb = breaker [label: "CB-327", rating: "MCCB / 16 A / 3P"]
f1l2m = motor [label: "MTR-1123", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-794", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2pnl = hub [label: "FD-967", rating: "3P+N"]
f2l1ld = load [label: "PNL-1479", rating: "ADMIN PANEL / 74 kW"]
f2l2cb = breaker [label: "CB-351", rating: "MCCB / 25 A / 3P"]
f2l2m = motor [label: "MTR-1198", rating: "11 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
