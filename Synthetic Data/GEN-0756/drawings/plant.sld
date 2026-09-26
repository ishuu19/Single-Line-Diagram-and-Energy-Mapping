sld "GEN-0756 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-480", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1665", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
busB = bus [label: "BUS-408", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1658", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-315", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-795", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
tie = bus_tie [label: "CB-397", rating: "400 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1455", rating: "UTILITY PANEL / 16 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1442", rating: "AUXILIARY PANEL / 11 kW"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-714", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1456", rating: "AUXILIARY PANEL / 37 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
