sld "GEN-0961 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1611", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1ld = load [label: "PNL-1464", rating: "CANOPY AUXILIARIES / 17 kW"]
f1l2ld = load [label: "PNL-1485", rating: "CANOPY AUXILIARIES / 27 kW"]
f2cb = breaker [label: "CB-383", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1412", rating: "CANOPY AUXILIARIES / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
