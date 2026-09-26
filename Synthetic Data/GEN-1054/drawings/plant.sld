sld "GEN-1054 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-449", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1677", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-716", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1pnl = hub [label: "FD-914", rating: "3P+N"]
f1l1cb = breaker [label: "CB-334", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1133", rating: "10 kW / EF"]
f1l2cb = breaker [label: "CB-355", rating: "MCCB / 16 A / 3P"]
f1l2m = motor [label: "MTR-1187", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-367", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1185", rating: "6 kW / EF"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f3pnl = hub [label: "FD-923", rating: "3P+N"]
f3l1ld = load [label: "PNL-1451", rating: "YARD LIGHTING / 28 kW"]
f3l2ld = load [label: "PNL-1413", rating: "REEFER RACK PANEL / 113 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
