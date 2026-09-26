sld "GEN-1193 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-473", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 515 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-302", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-775", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1475", rating: "SITE LIGHTING / 35 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
