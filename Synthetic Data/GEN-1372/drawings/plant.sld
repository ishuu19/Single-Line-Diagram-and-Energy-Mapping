sld "GEN-1372 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1627", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
busB = bus [label: "BUS-413", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1688", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-368", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-761", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
tie = bus_tie [label: "CB-304", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "ADMIN PANEL / 50 kW"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "CLASSROOM LIGHTING / 37 kW"]
f3cb = breaker [label: "CB-395", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-758", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1471", rating: "ADMIN PANEL / 68 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
