sld "GEN-0781 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-460", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1690", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-389", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-732", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
busB = bus [label: "BUS-421", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_yd [label: "TX-1601", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-366", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-791", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
tie = bus_tie [label: "CB-321", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1446", rating: "AUXILIARY PANEL / 54 kW"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1426", rating: "AUXILIARY PANEL / 27 kW"]
f3cb = breaker [label: "CB-364", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1442", rating: "AUXILIARY PANEL / 37 kW"]

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
busA -> f2cb [cable: "3#4/0 AWG"]
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
