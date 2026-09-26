sld "GEN-0193 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-477", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1659", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 322 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-320", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-750", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1479", rating: "ACADEMIC BLOCK PANEL / 62 kW"]
f2cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-715", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1473", rating: "ACADEMIC BLOCK PANEL / 62 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
