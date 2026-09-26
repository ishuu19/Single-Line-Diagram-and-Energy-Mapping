sld "GEN-0382 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1pnl = hub [label: "FD-933", rating: "3P+N"]
f1l1ld = load [label: "PNL-1471", rating: "SHORE POWER PANEL / 44 kW"]
f1l2cb = breaker [label: "CB-304", rating: "MCCB / 32 A / 3P"]
f1l2m = motor [label: "MTR-1198", rating: "14 kW / EF"]
f2cb = breaker [label: "CB-334", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-784", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-369", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1192", rating: "5 kW / EF"]
f3cb = breaker [label: "CB-346", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-721", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1486", rating: "DOCK LIGHTING / 25 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
