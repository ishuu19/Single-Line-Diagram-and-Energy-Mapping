sld "GEN-1116 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-410", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1679", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-373", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
busB = bus [label: "BUS-407", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "190 kW"]
mcbB1 = breaker [label: "CB-323", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
tie = ats [label: "CB-333", rating: "400 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1455", rating: "AUXILIARY PANEL / 43 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1450", rating: "AUXILIARY PANEL / 55 kW"]
f3cb = breaker [label: "CB-311", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-719", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-399", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1179", rating: "24 kW / COMP"]

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
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
