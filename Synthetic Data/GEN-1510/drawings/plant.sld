sld "GEN-1510 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-425", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1460", rating: "SHOP LIGHTING / 25 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2pnl = hub [label: "FD-981", rating: "3P+N"]
f2l1ld = load [label: "PNL-1469", rating: "SHOP LIGHTING / 22 kW"]
f2l2ld = load [label: "PNL-1459", rating: "PRESS FLOOR PANEL / 30 kW"]
f3cb = breaker [label: "CB-350", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1433", rating: "SHOP LIGHTING / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
