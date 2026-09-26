sld "GEN-1525 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-487", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1691", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1cb = breaker [label: "CB-343", rating: "MCCB / 16 A / 3P"]
f1l1drv = vfd [label: "DRV-836", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1120", rating: "7 kW / CRAC"]
f1l2cb = breaker [label: "CB-319", rating: "MCCB / 25 A / 3P"]
f1l2drv = vfd [label: "DRV-870", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1190", rating: "10 kW / CRAC"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "RECTIFIER PDU / 21 kW"]
f3cb = breaker [label: "CB-335", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1414", rating: "SHELTER LIGHTING / 7 kW"]

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
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
