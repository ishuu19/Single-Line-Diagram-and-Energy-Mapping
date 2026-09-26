sld "GEN-1232 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1636", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 535 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-385", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-754", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1465", rating: "ACADEMIC BLOCK PANEL / 41 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
