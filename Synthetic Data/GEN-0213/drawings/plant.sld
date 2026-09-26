sld "GEN-0213 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-471", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1650", rating: "130 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-364", rating: "MCCB / 160 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1622", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-309", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-737", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-316", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1199", rating: "16 kW / CRAC"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-399", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1144", rating: "18 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
