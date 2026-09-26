sld "GEN-1237 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-436", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1607", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-332", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-751", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-822", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1125", rating: "48 kW / PROC"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-309", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1137", rating: "84 kW / PROC"]
f3cb = breaker [label: "CB-394", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-731", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-398", rating: "MCCB / 80 A / 3P"]
f3l1drv = vfd [label: "DRV-865", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1196", rating: "44 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
