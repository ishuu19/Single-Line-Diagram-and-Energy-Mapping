sld "GEN-1222 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-430", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1692", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "470 kW"]
mcbA2 = breaker [label: "CB-337", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-739", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-349", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-307", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1141", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-339", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1192", rating: "46 kW / COMP"]

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
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
