sld "GEN-1163 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1608", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1pnl = hub [label: "FD-905", rating: "3P+N"]
f1l1ld = load [label: "PNL-1431", rating: "DOSING PANEL / 27 kW"]
f1l2ld = load [label: "PNL-1425", rating: "DOSING PANEL / 31 kW"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1155", rating: "44 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
