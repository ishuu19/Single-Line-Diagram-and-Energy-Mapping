sld "GEN-1543 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-406", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1699", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-716", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-332", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-847", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1108", rating: "37 kW / AHU"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f2pnl = hub [label: "FD-976", rating: "3P+N"]
f2l1ld = load [label: "PNL-1435", rating: "SITE LIGHTING / 19 kW"]
f2l2ld = load [label: "PNL-1451", rating: "ACADEMIC BLOCK PANEL / 61 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
