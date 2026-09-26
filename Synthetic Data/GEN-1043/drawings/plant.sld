sld "GEN-1043 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-433", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1696", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-358", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
busB = bus [label: "BUS-484", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "750 kW"]
mcbB1 = breaker [label: "CB-373", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-716", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
tie = ats [label: "CB-331", rating: "400 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "AUXILIARY PANEL / 12 kW"]
f2cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-316", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1128", rating: "10 kW / EF"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-709", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1403", rating: "ADMIN PANEL / 64 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
