sld "GEN-0702 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-410", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1698", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_dy [label: "TX-1630", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-312", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-736", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1pnl = hub [label: "FD-980", rating: "3P+N"]
f1l1cb = breaker [label: "CB-305", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-862", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1199", rating: "17 kW / BLOW"]
f1l2ld = load [label: "PNL-1415", rating: "DOSING PANEL / 23 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-749", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-382", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-866", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1193", rating: "23 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
