sld "GEN-0861 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-453", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1645", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "DOSING PANEL / 33 kW"]
f2cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1432", rating: "DOSING PANEL / 17 kW"]
f3cb = breaker [label: "CB-327", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f3pnl = hub [label: "FD-918", rating: "3P+N"]
f3l1cb = breaker [label: "CB-397", rating: "MCCB / 50 A / 3P"]
f3l1drv = vfd [label: "DRV-806", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1174", rating: "28 kW / RWP"]
f3l2cb = breaker [label: "CB-380", rating: "MCCB / 50 A / 3P"]
f3l2drv = vfd [label: "DRV-807", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1195", rating: "26 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
