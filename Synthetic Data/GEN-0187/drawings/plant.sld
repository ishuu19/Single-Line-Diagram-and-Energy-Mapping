sld "GEN-0187 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-363", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1154", rating: "22 kW / AHU"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2pnl = hub [label: "FD-914", rating: "3P+N"]
f2l1ld = load [label: "PNL-1430", rating: "ACADEMIC BLOCK PANEL / 66 kW"]
f2l2ld = load [label: "PNL-1419", rating: "SITE LIGHTING / 34 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
