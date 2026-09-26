sld "GEN-0110 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-448", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1639", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-321", rating: "MCCB / 160 A / 3P"]
f1l1m = motor [label: "MTR-1135", rating: "40 kW / COMP"]
f2cb = breaker [label: "CB-346", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-326", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-861", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1182", rating: "33 kW / PROC"]
f2x = capacitor_bank [label: "CAP-678", rating: "145 kVAR"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2ct -> f2x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
