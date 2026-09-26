sld "GEN-1104 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-462", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1695", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1444", rating: "FLOOR LIGHTING / 40 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
