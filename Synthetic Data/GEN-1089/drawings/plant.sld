sld "GEN-1089 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-450", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1601", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-350", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-359", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1140", rating: "14 kW / EF"]
f2cb = breaker [label: "CB-343", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1407", rating: "COMMON AREA LIGHTING / 21 kW"]
f3cb = breaker [label: "CB-301", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f3pnl = hub [label: "FD-975", rating: "3P+N"]
f3l1ld = load [label: "PNL-1473", rating: "COMMON AREA LIGHTING / 44 kW"]
f3l2cb = breaker [label: "CB-399", rating: "MCCB / 16 A / 3P"]
f3l2m = motor [label: "MTR-1120", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
