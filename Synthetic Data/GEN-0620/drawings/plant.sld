sld "GEN-0620 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1654", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-343", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1447", rating: "SHOP LIGHTING / 27 kW"]
f2cb = breaker [label: "CB-373", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2pnl = hub [label: "FD-968", rating: "3P+N"]
f2l1ld = load [label: "PNL-1448", rating: "SHOP LIGHTING / 34 kW"]
f2l2ld = load [label: "PNL-1441", rating: "SHOP LIGHTING / 28 kW"]
f3cb = breaker [label: "CB-344", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f3pnl = hub [label: "FD-917", rating: "3P+N"]
f3l1ld = load [label: "PNL-1439", rating: "SHOP AUXILIARIES / 33 kW"]
f3l2cb = breaker [label: "CB-372", rating: "MCCB / 125 A / 3P"]
f3l2drv = vfd [label: "DRV-854", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1127", rating: "30 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
