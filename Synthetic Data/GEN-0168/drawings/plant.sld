sld "GEN-0168 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1650", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1419", rating: "CANOPY AUXILIARIES / 16 kW"]
f2cb = breaker [label: "CB-344", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2pnl = hub [label: "FD-942", rating: "3P+N"]
f2l1ld = load [label: "PNL-1491", rating: "FORECOURT LIGHTING / 19 kW"]
f2l2ld = load [label: "PNL-1437", rating: "CANOPY AUXILIARIES / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
