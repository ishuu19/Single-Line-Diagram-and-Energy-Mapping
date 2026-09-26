sld "GEN-0067 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-431", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1658", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 238 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1484", rating: "CONTROL PANEL / 16 kW"]
f2cb = breaker [label: "CB-301", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1425", rating: "GROW LIGHTING / 48 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
