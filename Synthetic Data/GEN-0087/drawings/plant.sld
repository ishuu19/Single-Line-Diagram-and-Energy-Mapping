sld "GEN-0087 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-417", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-335", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-768", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "UTILITY PANEL / 18 kW"]
f2cb = breaker [label: "CB-373", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1465", rating: "UTILITY PANEL / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
