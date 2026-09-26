sld "GEN-1437 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-458", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1626", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
busB = bus [label: "BUS-418", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "300 kW"]
mcbB1 = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-729", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
tie = ats [label: "CB-369", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1498", rating: "AUXILIARY PANEL / 23 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1428", rating: "AUXILIARY PANEL / 28 kW"]
f3cb = breaker [label: "CB-338", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1407", rating: "AUXILIARY PANEL / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
