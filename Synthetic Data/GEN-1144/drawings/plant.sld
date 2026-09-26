sld "GEN-1144 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-415", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-740", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-389", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-823", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1114", rating: "19 kW / AHU"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
