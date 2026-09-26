sld "GEN-0601 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-400", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1478", rating: "ACADEMIC BLOCK PANEL / 57 kW"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1491", rating: "ACADEMIC BLOCK PANEL / 86 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
