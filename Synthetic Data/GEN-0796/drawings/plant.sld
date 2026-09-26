sld "GEN-0796 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-484", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1676", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "SHELTER LIGHTING / 7 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
