sld "GEN-1159 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-415", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1652", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-708", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
busB = bus [label: "BUS-448", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1638", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-363", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-742", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
tie = bus_tie [label: "CB-366", rating: "400 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1477", rating: "DOSING PANEL / 24 kW"]
f2cb = breaker [label: "CB-379", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1452", rating: "DOSING PANEL / 35 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
