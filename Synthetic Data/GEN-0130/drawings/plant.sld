sld "GEN-0130 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-474", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1688", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-390", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
busB = bus [label: "BUS-492", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
mcbB1 = breaker [label: "CB-345", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-733", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
tie = bus_tie [label: "CB-315", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-337", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1477", rating: "COMMON AREA LIGHTING / 24 kW"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1421", rating: "AUXILIARY PANEL / 9 kW"]
f3cb = breaker [label: "CB-308", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1443", rating: "AUXILIARY PANEL / 21 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
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
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
