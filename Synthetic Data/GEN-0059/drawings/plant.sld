sld "GEN-0059 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-435", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1665", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
busB = bus [label: "BUS-449", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
mcbB1 = breaker [label: "CB-358", rating: "ACB / 3000 A / 3P"]
mctB1 = ct [label: "TA-758", rating: "3 CTs / 3000/5 A"]
mpmB1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
tie = bus_tie [label: "CB-366", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1pnl = hub [label: "FD-925", rating: "3P+N"]
f1l1ld = load [label: "PNL-1456", rating: "AUXILIARY PANEL / 268 kW"]
f1l2ld = load [label: "PNL-1470", rating: "AUXILIARY PANEL / 455 kW"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f2pnl = hub [label: "FD-983", rating: "3P+N"]
f2l1ld = load [label: "PNL-1442", rating: "MCC AUXILIARY BOARD / 90 kW"]
f2l2ld = load [label: "PNL-1479", rating: "MCC AUXILIARY BOARD / 76 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
