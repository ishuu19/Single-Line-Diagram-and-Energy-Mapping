sld "GEN-1217 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-456", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1614", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-800", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1143", rating: "48 kW / PROC"]
f2cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-781", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-371", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-892", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1174", rating: "29 kW / PROC"]
f3cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-755", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-808", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1136", rating: "54 kW / PROC"]

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
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
