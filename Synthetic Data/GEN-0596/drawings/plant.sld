sld "GEN-0596 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-473", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1656", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-783", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-343", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-836", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1151", rating: "49 kW / PROC"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-326", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1182", rating: "27 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
