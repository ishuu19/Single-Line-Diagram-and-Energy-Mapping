sld "GEN-1033 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-418", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1698", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-349", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-338", rating: "MCCB / 50 A / 3P"]
f1l1drv = vfd [label: "DRV-838", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1106", rating: "25 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
