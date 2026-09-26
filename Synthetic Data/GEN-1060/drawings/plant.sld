sld "GEN-1060 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1pnl = hub [label: "FD-977", rating: "3P+N"]
f1l1ld = load [label: "PNL-1472", rating: "CANOPY AUXILIARIES / 28 kW"]
f1l2ld = load [label: "PNL-1412", rating: "CANOPY AUXILIARIES / 25 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1474", rating: "FORECOURT LIGHTING / 13 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
