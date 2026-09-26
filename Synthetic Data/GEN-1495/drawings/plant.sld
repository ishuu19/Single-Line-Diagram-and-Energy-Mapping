sld "GEN-1495 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-413", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1668", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-328", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1124", rating: "28 kW / COND"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-378", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1143", rating: "18 kW / COND"]
f3cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-701", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-382", rating: "MCCB / 40 A / 3P"]
f3l1drv = vfd [label: "DRV-842", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1112", rating: "20 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
