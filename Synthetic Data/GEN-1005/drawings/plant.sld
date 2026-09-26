sld "GEN-1005 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-441", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1689", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-368", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1pnl = hub [label: "FD-912", rating: "3P+N"]
f1l1ld = load [label: "PNL-1415", rating: "DOCK PANEL / 17 kW"]
f1l2cb = breaker [label: "CB-346", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1158", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1442", rating: "DOCK PANEL / 29 kW"]
f3cb = breaker [label: "CB-332", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-377", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1148", rating: "24 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
