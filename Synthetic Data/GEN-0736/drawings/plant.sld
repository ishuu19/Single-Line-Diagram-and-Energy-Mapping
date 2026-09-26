sld "GEN-0736 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-453", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-387", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-790", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1pnl = hub [label: "FD-958", rating: "3P+N"]
f1l1ld = load [label: "PNL-1463", rating: "REEFER RACK PANEL / 127 kW"]
f1l2ld = load [label: "PNL-1493", rating: "REEFER RACK PANEL / 104 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
