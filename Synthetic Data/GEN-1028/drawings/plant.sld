sld "GEN-1028 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-435", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1636", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1657", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-300", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-771", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1482", rating: "CLASSROOM LIGHTING / 51 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2pnl = hub [label: "FD-936", rating: "3P+N"]
f2l1ld = load [label: "PNL-1433", rating: "AUXILIARY PANEL / 6 kW"]
f2l2ld = load [label: "PNL-1485", rating: "AUXILIARY PANEL / 9 kW"]
f3cb = breaker [label: "CB-303", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-791", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1498", rating: "ADMIN PANEL / 59 kW"]

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
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
