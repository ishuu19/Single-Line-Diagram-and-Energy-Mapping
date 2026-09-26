sld "GEN-0286 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-486", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1690", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-335", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
busB = bus [label: "BUS-411", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
mcbB1 = breaker [label: "CB-387", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-796", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
tie = bus_tie [label: "CB-395", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1440", rating: "LIFE SAFETY BRANCH / 52 kW"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1428", rating: "LIFE SAFETY BRANCH / 52 kW"]
f3cb = breaker [label: "CB-386", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-742", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1417", rating: "AUXILIARY PANEL / 22 kW"]

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
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
