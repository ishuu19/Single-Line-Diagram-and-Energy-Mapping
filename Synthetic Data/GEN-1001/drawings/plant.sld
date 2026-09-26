sld "GEN-1001 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1686", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1489", rating: "SHOP LIGHTING / 20 kW"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-759", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f2pnl = hub [label: "FD-967", rating: "3P+N"]
f2l1ld = load [label: "PNL-1474", rating: "PRESS FLOOR PANEL / 40 kW"]
f2l2cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f2l2drv = vfd [label: "DRV-856", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1139", rating: "26 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
