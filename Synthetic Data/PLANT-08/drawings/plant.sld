sld "PLANT-08 — CEMENT WORKS / MILL ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 6.6kV, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "6.6kV"]
srcA1 = utility [label: "33 kV GRID", voltage: "33kV"]
laA1 = surge_arrester [label: "LA-1299", voltage: "33kV"]
txA1 = transformer_3winding [label: "TX-1600", rating: "12500 kVA", voltage: "33kV / 6.6kV"]
mcbA1 = breaker_vacuum [label: "CB-348", rating: "VCB / 1250 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 1250/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 630 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 600/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-376", rating: "MCCB / 320 A / 3P"]
f1l1drv = vfd [label: "DRV-837", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1120", rating: "2500 kW / MILL"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 630 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 600/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-332", rating: "MCCB / 250 A / 3P"]
f2l1drv = vfd [label: "DRV-836", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1168", rating: "1800 kW / MILL"]
f3cb = breaker [label: "CB-311", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-761", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3pnl = hub [label: "FD-903", rating: "3P+N"]
f3l1cb = breaker [label: "CB-365", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1126", rating: "450 kW / BLOW"]
f3l2cb = breaker [label: "CB-352", rating: "MCCB / 63 A / 3P"]
f3l2m = motor [label: "MTR-1134", rating: "450 kW / BLOW"]
f3l3cb = breaker [label: "CB-374", rating: "MCCB / 40 A / 3P"]
f3l3m = motor [label: "MTR-1119", rating: "315 kW / COMP"]
f4cb = breaker [label: "CB-389", rating: "MCCB / 250 A / 3P"]
f4ct = ct [label: "TA-719", rating: "3 CTs / 250/5 A"]
f4pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f4l1ld = load [label: "PNL-1450", rating: "LV AUXILIARY BOARD / 600 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#350 MCM"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#350 MCM"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
f3pnl -> f3l3cb
f3l3cb -> f3l3m
busA -> f4cb [cable: "3#2/0 AWG"]
f4cb -> f4ct
f4ct -> f4l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
