sld "GEN-0915 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-447", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1662", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-399", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
busB = bus [label: "BUS-418", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1636", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-355", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-731", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
tie = bus_tie [label: "CB-385", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1402", rating: "DC FAST CHARGER BANK / 221 kW"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1453", rating: "FORECOURT LIGHTING / 22 kW"]
f3cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-769", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1479", rating: "FORECOURT LIGHTING / 13 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
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
