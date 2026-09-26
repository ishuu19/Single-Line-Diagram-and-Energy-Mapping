sld "GEN-0453 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-433", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "2490 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-349", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
busB = bus [label: "BUS-434", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1640", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-305", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-789", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
tie = bus_tie [label: "CB-366", rating: "400 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1460", rating: "AUXILIARY PANEL / 580 kW"]
f2cb = breaker [label: "CB-346", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-758", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "AUXILIARY PANEL / 76 kW"]
f3cb = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1462", rating: "MCC AUXILIARY BOARD / 80 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
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
