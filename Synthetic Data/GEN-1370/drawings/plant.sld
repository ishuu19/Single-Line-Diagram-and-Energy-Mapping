sld "GEN-1370 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-465", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1642", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 402 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-336", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-723", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1495", rating: "AUXILIARY PANEL / 15 kW"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-356", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-823", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1179", rating: "24 kW / AHU"]
f3cb = breaker [label: "CB-332", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-789", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1457", rating: "SITE LIGHTING / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
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
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
