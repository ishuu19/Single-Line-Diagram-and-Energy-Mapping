sld "GEN-0327 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-444", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1650", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-313", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-768", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-320", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-834", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1118", rating: "25 kW / PROC"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
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
