sld "GEN-1263 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-475", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1675", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1pnl = hub [label: "FD-952", rating: "3P+N"]
f1l1ld = load [label: "PNL-1431", rating: "CANOPY AUXILIARIES / 31 kW"]
f1l2ld = load [label: "PNL-1468", rating: "CANOPY AUXILIARIES / 22 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-756", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1434", rating: "CANOPY AUXILIARIES / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
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
