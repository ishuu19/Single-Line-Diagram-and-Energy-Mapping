sld "PLANT-03 — WATER TREATMENT WORKS / ELECTRICAL DISTRIBUTION"
# PUMP STATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "11 kV INCOMER", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1674", rating: "1000 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
srcA2 = utility [label: "11 kV STANDBY", voltage: "11kV"]
txA2 = transformer_dy [label: "TX-1682", rating: "1000 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-351", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-703", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 630 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 600/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1pnl = hub [label: "FD-913", rating: "3P+N"]
f1l1cb = breaker [label: "CB-335", rating: "MCCB / 200 A / 3P"]
f1l1drv = vfd [label: "DRV-873", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1136", rating: "90 kW / RWP"]
f1l2cb = breaker [label: "CB-304", rating: "MCCB / 200 A / 3P"]
f1l2drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1140", rating: "90 kW / RWP"]
f1l3cb = breaker [label: "CB-384", rating: "MCCB / 200 A / 3P"]
f1l3drv = vfd [label: "DRV-879", rating: "VFD / OL"]
f1l3m = motor [label: "MTR-1154", rating: "90 kW / RWP"]
f2cb = breaker [label: "CB-346", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2pnl = hub [label: "FD-947", rating: "3P+N"]
f2l1cb = breaker [label: "CB-352", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-870", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1118", rating: "37 kW / BLOW"]
f2l2cb = breaker [label: "CB-380", rating: "MCCB / 80 A / 3P"]
f2l2drv = vfd [label: "DRV-890", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1149", rating: "37 kW / BLOW"]
f2l3cb = breaker [label: "CB-319", rating: "MCCB / 80 A / 3P"]
f2l3drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f2l3m = motor [label: "MTR-1147", rating: "37 kW / BLOW"]
f3cb = breaker [label: "CB-309", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-702", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3pnl = hub [label: "FD-924", rating: "3P+N"]
f3l1cb = breaker [label: "CB-338", rating: "MCCB / 40 A / 3P"]
f3l1m = motor [label: "MTR-1177", rating: "18 kW / RWP"]
f3l2cb = breaker [label: "CB-379", rating: "MCCB / 40 A / 3P"]
f3l2m = motor [label: "MTR-1104", rating: "18 kW / RWP"]
f3l3ld = load [label: "PNL-1433", rating: "DOSING PANEL / 24 kW"]
f4cb = breaker [label: "CB-395", rating: "MCCB / 100 A / 3P"]
f4ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f4pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f4l1ld = load [label: "PNL-1498", rating: "MCC AUXILIARIES / 45 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#350 MCM"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
f1pnl -> f1l3cb
f1l3cb -> f1l3drv
f1l3drv -> f1l3m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
f2pnl -> f2l3cb
f2l3cb -> f2l3drv
f2l3drv -> f2l3m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
f3pnl -> f3l3ld
busA -> f4cb [cable: "3#4 AWG"]
f4cb -> f4ct
f4ct -> f4l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
