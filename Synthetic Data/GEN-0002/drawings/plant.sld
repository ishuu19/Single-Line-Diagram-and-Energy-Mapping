sld "GEN-0002 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-450", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1656", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-311", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
busB = bus [label: "BUS-440", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
mcbB1 = breaker [label: "CB-375", rating: "MCCB / 800 A / 3P"]
mctB1 = ct [label: "TA-783", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
tie = bus_tie [label: "CB-308", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1423", rating: "AUXILIARY PANEL / 21 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1404", rating: "CONTROL PANEL / 13 kW"]
f3cb = breaker [label: "CB-337", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-762", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1442", rating: "GROW LIGHTING / 33 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
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
