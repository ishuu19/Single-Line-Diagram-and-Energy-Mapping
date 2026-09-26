sld "GEN-0631 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1629", rating: "110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1cb = breaker [label: "CB-323", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1125", rating: "13 kW / CRAC"]
f1l2ld = load [label: "PNL-1413", rating: "SHELTER LIGHTING / 7 kW"]
f2cb = breaker [label: "CB-382", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-716", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f2pnl = hub [label: "FD-982", rating: "3P+N"]
f2l1ld = load [label: "PNL-1451", rating: "RECTIFIER PDU / 21 kW"]
f2l2ld = load [label: "PNL-1497", rating: "RECTIFIER PDU / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
