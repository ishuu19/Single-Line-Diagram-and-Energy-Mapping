sld "GEN-0119 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1633", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-367", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-364", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-816", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1100", rating: "77 kW / PROC"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-354", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-846", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1135", rating: "68 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
