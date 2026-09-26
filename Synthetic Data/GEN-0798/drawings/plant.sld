sld "GEN-0798 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-421", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1632", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1pnl = hub [label: "FD-930", rating: "3P+N"]
f1l1cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1151", rating: "26 kW / COND"]
f1l2ld = load [label: "PNL-1423", rating: "DOCK PANEL / 17 kW"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1150", rating: "29 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
