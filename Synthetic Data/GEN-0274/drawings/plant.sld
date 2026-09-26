sld "GEN-0274 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-416", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1601", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1pnl = hub [label: "FD-981", rating: "3P+N"]
f1l1ld = load [label: "PNL-1449", rating: "AUXILIARY PANEL / 83 kW"]
f1l2cb = breaker [label: "CB-320", rating: "MCCB / 80 A / 3P"]
f1l2m = motor [label: "MTR-1100", rating: "35 kW / COMP"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1189", rating: "28 kW / COMP"]
f3cb = breaker [label: "CB-341", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3pnl = hub [label: "FD-987", rating: "3P+N"]
f3l1ld = load [label: "PNL-1450", rating: "SHOP AUXILIARIES / 29 kW"]
f3l2ld = load [label: "PNL-1437", rating: "SHOP LIGHTING / 18 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
