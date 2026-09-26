sld "GEN-0644 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-456", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-751", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1414", rating: "RECTIFIER PDU / 43 kW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-314", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-817", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1111", rating: "7 kW / CRAC"]
f3cb = breaker [label: "CB-343", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-784", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1460", rating: "RECTIFIER PDU / 28 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
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
