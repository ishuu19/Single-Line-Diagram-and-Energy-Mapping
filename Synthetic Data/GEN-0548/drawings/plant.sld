sld "GEN-0548 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-436", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1633", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-370", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1417", rating: "ACADEMIC BLOCK PANEL / 95 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1457", rating: "SITE LIGHTING / 24 kW"]
f3cb = breaker [label: "CB-392", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1431", rating: "SITE LIGHTING / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
