sld "GEN-0387 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-427", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1622", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-339", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 599 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-302", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-745", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1460", rating: "ACADEMIC BLOCK PANEL / 89 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1406", rating: "SITE LIGHTING / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
