sld "GEN-1324 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-487", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1698", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-309", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
busB = bus [label: "BUS-491", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1672", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-327", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-751", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
tie = bus_tie [label: "CB-341", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 30 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1404", rating: "FLOOR LIGHTING / 64 kW"]
f3cb = breaker [label: "CB-323", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1406", rating: "AUXILIARY PANEL / 10 kW"]

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
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
