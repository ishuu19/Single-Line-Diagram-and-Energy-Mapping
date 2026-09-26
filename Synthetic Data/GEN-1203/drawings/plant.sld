sld "GEN-1203 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
busB = bus [label: "BUS-476", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "100 kW"]
mcbB1 = breaker [label: "CB-355", rating: "ACB / 160 A / 3P"]
mctB1 = ct [label: "TA-750", rating: "3 CTs / 160/5 A"]
mpmB1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
tie = ats [label: "CB-319", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1pnl = hub [label: "FD-956", rating: "3P+N"]
f1l1ld = load [label: "PNL-1419", rating: "AUXILIARY PANEL / 10 kW"]
f1l2ld = load [label: "PNL-1483", rating: "SHELTER LIGHTING / 8 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-798", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-372", rating: "MCCB / 25 A / 3P"]
f2l1drv = vfd [label: "DRV-897", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1188", rating: "12 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
