sld "GEN-0394 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-486", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1600", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
busB = bus [label: "BUS-432", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "750 kW"]
mcbB1 = breaker [label: "CB-347", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-755", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
tie = ats [label: "CB-345", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1412", rating: "SHORE POWER PANEL / 53 kW"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "DOCK LIGHTING / 22 kW"]
f3cb = breaker [label: "CB-308", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1486", rating: "AUXILIARY PANEL / 14 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#2/0 AWG"]
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
