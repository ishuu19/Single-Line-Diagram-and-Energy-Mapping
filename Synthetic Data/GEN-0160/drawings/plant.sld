sld "GEN-0160 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-490", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1661", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-301", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-751", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
busB = bus [label: "BUS-443", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "120 kW"]
mcbB1 = breaker [label: "CB-361", rating: "ACB / 160 A / 3P"]
mctB1 = ct [label: "TA-750", rating: "3 CTs / 160/5 A"]
mpmB1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
tie = ats [label: "CB-362", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1401", rating: "AUXILIARY PANEL / 14 kW"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-760", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1415", rating: "RECTIFIER PDU / 27 kW"]
f3cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-761", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1472", rating: "AUXILIARY PANEL / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
