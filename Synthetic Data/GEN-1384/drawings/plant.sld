sld "GEN-1384 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-429", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1641", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
busB = bus [label: "BUS-431", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1668", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-398", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-796", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
tie = bus_tie [label: "CB-381", rating: "800 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1472", rating: "AUXILIARY PANEL / 23 kW"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1437", rating: "DOSING PANEL / 37 kW"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1427", rating: "DOSING PANEL / 17 kW"]

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
busA -> f1cb [cable: "3#1/0 AWG"]
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
