sld "GEN-0218 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1652", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-730", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1477", rating: "SHOP AUXILIARIES / 43 kW"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1413", rating: "SHOP LIGHTING / 23 kW"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f3pnl = hub [label: "FD-947", rating: "3P+N"]
f3l1ld = load [label: "PNL-1405", rating: "SHOP LIGHTING / 15 kW"]
f3l2cb = breaker [label: "CB-398", rating: "MCCB / 50 A / 3P"]
f3l2m = motor [label: "MTR-1139", rating: "24 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
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
