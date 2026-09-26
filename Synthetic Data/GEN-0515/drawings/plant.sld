sld "GEN-0515 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-488", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1641", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-378", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
busB = bus [label: "BUS-495", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1652", rating: "900 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-357", rating: "MCCB / 2500 A / 3P"]
mctB1 = ct [label: "TA-769", rating: "3 CTs / 2500/5 A"]
mpmB1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
tie = bus_tie [label: "CB-361", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1479", rating: "MCC AUXILIARY BOARD / 58 kW"]
f2cb = breaker [label: "CB-325", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2pnl = hub [label: "FD-981", rating: "3P+N"]
f2l1ld = load [label: "PNL-1465", rating: "MCC AUXILIARY BOARD / 40 kW"]
f2l2ld = load [label: "PNL-1422", rating: "MCC AUXILIARY BOARD / 57 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
