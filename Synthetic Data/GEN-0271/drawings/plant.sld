sld "GEN-0271 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-453", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1664", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-307", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1421", rating: "CANOPY AUXILIARIES / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
