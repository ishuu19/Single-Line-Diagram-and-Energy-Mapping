sld "GEN-1449 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-440", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-375", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-887", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1169", rating: "42 kW / COMP"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-727", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-331", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1103", rating: "7 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
