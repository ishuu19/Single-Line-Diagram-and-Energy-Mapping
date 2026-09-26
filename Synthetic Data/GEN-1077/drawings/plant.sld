sld "GEN-1077 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-475", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
busB = bus [label: "BUS-425", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1627", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-329", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
tie = bus_tie [label: "CB-356", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-363", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-894", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1154", rating: "56 kW / PROC"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "PACKAGING PANEL / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
