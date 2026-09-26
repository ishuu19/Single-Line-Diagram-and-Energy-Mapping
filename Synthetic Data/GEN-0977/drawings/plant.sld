sld "GEN-0977 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-473", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 329 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-393", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-735", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1496", rating: "ACADEMIC BLOCK PANEL / 89 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
