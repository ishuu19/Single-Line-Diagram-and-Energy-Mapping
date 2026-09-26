sld "GEN-1209 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-493", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1686", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-365", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-730", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 344 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-326", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-778", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-783", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-873", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1165", rating: "28 kW / AHU"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-758", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1464", rating: "ACADEMIC BLOCK PANEL / 98 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
