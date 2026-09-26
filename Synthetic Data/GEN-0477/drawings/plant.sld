sld "GEN-0477 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1603", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1pnl = hub [label: "FD-932", rating: "3P+N"]
f1l1ld = load [label: "PNL-1453", rating: "FORECOURT LIGHTING / 24 kW"]
f1l2ld = load [label: "PNL-1403", rating: "DC FAST CHARGER BANK / 157 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
