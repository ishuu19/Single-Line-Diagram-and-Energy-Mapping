sld "GEN-1424 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-491", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1658", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 160 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-325", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-781", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-894", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1121", rating: "35 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
