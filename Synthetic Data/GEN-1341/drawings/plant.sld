sld "GEN-1341 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-476", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1666", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-320", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1480", rating: "ACADEMIC BLOCK PANEL / 95 kW"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "SITE LIGHTING / 25 kW"]
f3cb = breaker [label: "CB-395", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1490", rating: "ACADEMIC BLOCK PANEL / 42 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
