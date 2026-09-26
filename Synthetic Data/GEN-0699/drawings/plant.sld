sld "GEN-0699 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-435", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
busB = bus [label: "BUS-436", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1634", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-321", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-719", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
tie = bus_tie [label: "CB-310", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "AUXILIARY PANEL / 74 kW"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 11 kW"]
f3cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1498", rating: "AUXILIARY PANEL / 30 kW"]

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
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
