sld "GEN-0714 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1674", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-362", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-742", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-341", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1137", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-382", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f2pnl = hub [label: "FD-942", rating: "3P+N"]
f2l1ld = load [label: "PNL-1443", rating: "COMMON AREA LIGHTING / 49 kW"]
f2l2cb = breaker [label: "CB-332", rating: "MCCB / 32 A / 3P"]
f2l2m = motor [label: "MTR-1165", rating: "14 kW / EF"]
f3cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-767", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1411", rating: "COMMON AREA LIGHTING / 45 kW"]

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
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
