sld "GEN-0342 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-439", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1622", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-350", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1408", rating: "SITE LIGHTING / 25 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1497", rating: "ACADEMIC BLOCK PANEL / 44 kW"]
f3cb = breaker [label: "CB-340", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1463", rating: "SITE LIGHTING / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
