sld "GEN-1427 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-477", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "YARD LIGHTING / 29 kW"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1430", rating: "YARD LIGHTING / 24 kW"]
f3cb = breaker [label: "CB-314", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f3pnl = hub [label: "FD-933", rating: "3P+N"]
f3l1cb = breaker [label: "CB-300", rating: "MCCB / 16 A / 3P"]
f3l1m = motor [label: "MTR-1151", rating: "5 kW / EF"]
f3l2ld = load [label: "PNL-1471", rating: "REEFER RACK PANEL / 123 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
