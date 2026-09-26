sld "GEN-0623 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-425", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1640", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
busB = bus [label: "BUS-489", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1634", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-366", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-718", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
tie = bus_tie [label: "CB-391", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1410", rating: "AUXILIARY PANEL / 33 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-715", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2pnl = hub [label: "FD-966", rating: "3P+N"]
f2l1cb = breaker [label: "CB-398", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-840", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1103", rating: "27 kW / AHU"]
f2l2ld = load [label: "PNL-1455", rating: "ACADEMIC BLOCK PANEL / 40 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
