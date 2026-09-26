sld "GEN-1025 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-471", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1649", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-302", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1cb = breaker [label: "CB-386", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-368", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1164", rating: "33 kW / CRAC"]
f2cb = breaker [label: "CB-358", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-714", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-346", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-870", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1165", rating: "29 kW / CRAC"]
f3cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-784", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1440", rating: "TENANT PANEL / 92 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
