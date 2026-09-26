sld "GEN-0614 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-457", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1630", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-392", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1686", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-343", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-792", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-333", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1437", rating: "PRESS FLOOR PANEL / 34 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
