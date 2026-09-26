sld "GEN-1502 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-451", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1604", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-303", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
busB = bus [label: "BUS-495", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1607", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-386", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-777", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
tie = bus_tie [label: "CB-380", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1487", rating: "AUXILIARY PANEL / 43 kW"]
f1x = harmonic_filter [label: "HF-553", rating: "5th / 7th"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1432", rating: "AUXILIARY PANEL / 58 kW"]

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
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
f1ct -> f1x
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
