sld "GEN-0997 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-486", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "60 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-384", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "SHELTER LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-341", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-831", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1196", rating: "16 kW / CRAC"]
f3cb = breaker [label: "CB-385", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1437", rating: "RECTIFIER PDU / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
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
