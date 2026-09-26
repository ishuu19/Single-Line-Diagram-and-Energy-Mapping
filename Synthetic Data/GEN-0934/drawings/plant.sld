sld "GEN-0934 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-496", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1610", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-398", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1108", rating: "17 kW / AHU"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1429", rating: "ADMIN PANEL / 72 kW"]

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
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
