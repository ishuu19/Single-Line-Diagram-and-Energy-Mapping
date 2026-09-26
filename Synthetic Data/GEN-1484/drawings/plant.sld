sld "GEN-1484 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-425", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1651", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-385", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1409", rating: "COMMON AREA LIGHTING / 27 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-797", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1424", rating: "RISER PANEL / 87 kW"]
f3cb = breaker [label: "CB-331", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-774", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-337", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1105", rating: "11 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
