sld "GEN-0179 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-469", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-746", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
busB = bus [label: "BUS-415", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1646", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-397", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-749", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
tie = bus_tie [label: "CB-311", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1450", rating: "FORECOURT LIGHTING / 10 kW"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1423", rating: "DC FAST CHARGER BANK / 236 kW"]
f3cb = breaker [label: "CB-378", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-772", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1491", rating: "CANOPY AUXILIARIES / 30 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
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
