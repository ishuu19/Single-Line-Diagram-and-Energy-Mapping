sld "GEN-0894 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-420", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1648", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-385", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1123", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-751", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-339", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1109", rating: "14 kW / EF"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f3pnl = hub [label: "FD-961", rating: "3P+N"]
f3l1cb = breaker [label: "CB-303", rating: "MCCB / 20 A / 3P"]
f3l1m = motor [label: "MTR-1172", rating: "8 kW / EF"]
f3l2ld = load [label: "PNL-1464", rating: "HOUSE PANEL / 57 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
