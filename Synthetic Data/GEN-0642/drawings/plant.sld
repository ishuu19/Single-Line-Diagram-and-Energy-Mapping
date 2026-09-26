sld "GEN-0642 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1689", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-373", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-751", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
busB = bus [label: "BUS-477", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
mcbB1 = breaker [label: "CB-370", rating: "ACB / 3000 A / 3P"]
mctB1 = ct [label: "TA-736", rating: "3 CTs / 3000/5 A"]
mpmB1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
tie = bus_tie [label: "CB-357", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1pnl = hub [label: "FD-963", rating: "3P+N"]
f1l1ld = load [label: "PNL-1444", rating: "AUXILIARY PANEL / 246 kW"]
f1l2ld = load [label: "PNL-1417", rating: "AUXILIARY PANEL / 221 kW"]
f2cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2pnl = hub [label: "FD-962", rating: "3P+N"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 320 A / 3P"]
f2l1m = motor [label: "MTR-1116", rating: "133 kW / BLOW"]
f2l2ld = load [label: "PNL-1481", rating: "MCC AUXILIARY BOARD / 85 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
