sld "GEN-0330 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-437", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1691", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-339", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
busB = bus [label: "BUS-421", voltage: "480Y/277V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "1490 kW"]
mcbB1 = breaker [label: "CB-340", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-727", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
tie = ats [label: "CB-368", rating: "400 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1451", rating: "AUXILIARY PANEL / 73 kW"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1427", rating: "AUXILIARY PANEL / 43 kW"]
f3cb = breaker [label: "CB-365", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-777", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1412", rating: "PACKAGING PANEL / 17 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
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
