sld "GEN-0656 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-476", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1680", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-383", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-724", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1pnl = hub [label: "FD-917", rating: "3P+N"]
f1l1ld = load [label: "PNL-1405", rating: "CONTROL PANEL / 12 kW"]
f1l2ld = load [label: "PNL-1497", rating: "AUXILIARY PANEL / 27 kW"]
f2cb = breaker [label: "CB-311", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-340", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1192", rating: "13 kW / RWP"]
f3cb = breaker [label: "CB-320", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-759", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1419", rating: "AUXILIARY PANEL / 21 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
