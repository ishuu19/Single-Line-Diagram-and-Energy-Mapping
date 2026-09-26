sld "GEN-0534 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1658", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
busB = bus [label: "BUS-443", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1655", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-324", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-714", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
tie = bus_tie [label: "CB-363", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1pnl = hub [label: "FD-987", rating: "3P+N"]
f1l1cb = breaker [label: "CB-393", rating: "MCCB / 25 A / 3P"]
f1l1drv = vfd [label: "DRV-848", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1135", rating: "11 kW / CRAC"]
f1l2ld = load [label: "PNL-1434", rating: "SHELTER LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "RECTIFIER PDU / 53 kW"]

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
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
