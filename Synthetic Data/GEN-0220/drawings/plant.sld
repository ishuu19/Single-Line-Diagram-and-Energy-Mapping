sld "GEN-0220 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-459", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1621", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-740", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
busB = bus [label: "BUS-472", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1614", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-399", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-732", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
tie = bus_tie [label: "CB-367", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1454", rating: "AUXILIARY PANEL / 47 kW"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1434", rating: "AUXILIARY PANEL / 34 kW"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-718", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1496", rating: "PACKAGING PANEL / 10 kW"]

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
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
