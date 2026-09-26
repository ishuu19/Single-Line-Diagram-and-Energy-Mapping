sld "GEN-1278 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-449", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-350", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 544 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-312", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-722", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-769", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1404", rating: "SITE LIGHTING / 33 kW"]

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
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
