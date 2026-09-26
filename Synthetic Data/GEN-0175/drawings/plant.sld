sld "GEN-0175 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-419", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1654", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-747", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
busB = bus [label: "BUS-486", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1605", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-384", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-703", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
tie = bus_tie [label: "CB-316", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-317", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1448", rating: "SITE LIGHTING / 23 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2pnl = hub [label: "FD-940", rating: "3P+N"]
f2l1ld = load [label: "PNL-1471", rating: "AUXILIARY PANEL / 28 kW"]
f2l2cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f2l2drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1103", rating: "25 kW / AHU"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
