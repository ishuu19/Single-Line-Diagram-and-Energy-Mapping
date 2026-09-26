sld "GEN-0418 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1603", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "AUXILIARY PANEL / 61 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f2pnl = hub [label: "FD-951", rating: "3P+N"]
f2l1cb = breaker [label: "CB-382", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1192", rating: "46 kW / RWP"]
f2l2ld = load [label: "PNL-1464", rating: "DOSING PANEL / 31 kW"]
f3cb = breaker [label: "CB-323", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-334", rating: "MCCB / 160 A / 3P"]
f3l1drv = vfd [label: "DRV-866", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1152", rating: "66 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
