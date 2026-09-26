sld "GEN-0447 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-449", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1614", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-382", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-821", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1142", rating: "21 kW / CRAC"]
f2cb = breaker [label: "CB-342", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2pnl = hub [label: "FD-901", rating: "3P+N"]
f2l1ld = load [label: "PNL-1489", rating: "SHELTER LIGHTING / 5 kW"]
f2l2ld = load [label: "PNL-1412", rating: "RECTIFIER PDU / 41 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
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
