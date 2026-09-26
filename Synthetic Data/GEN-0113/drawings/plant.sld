sld "GEN-0113 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-492", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1636", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-360", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
busB = bus [label: "BUS-407", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "1490 kW"]
mcbB1 = breaker [label: "CB-351", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-798", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
tie = ats [label: "CB-373", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1445", rating: "DOCK LIGHTING / 23 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-715", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-368", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1134", rating: "13 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
