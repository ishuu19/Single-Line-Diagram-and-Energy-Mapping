sld "GEN-0248 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1628", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-388", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-796", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-329", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-805", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1179", rating: "32 kW / PROC"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-799", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1402", rating: "SHOP LIGHTING / 29 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
