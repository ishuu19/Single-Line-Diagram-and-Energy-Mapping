sld "GEN-0337 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
busB = bus [label: "BUS-415", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1000 kW"]
mcbB1 = breaker [label: "CB-329", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-764", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
tie = ats [label: "CB-327", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-309", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "CLASSROOM LIGHTING / 34 kW"]
f3cb = breaker [label: "CB-354", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-828", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1155", rating: "26 kW / AHU"]

srcA1 -> mcbA1
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
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
