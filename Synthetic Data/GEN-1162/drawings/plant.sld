sld "GEN-1162 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1634", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-384", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-375", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1114", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1499", rating: "REEFER RACK PANEL / 63 kW"]
f3cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-767", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f3pnl = hub [label: "FD-986", rating: "3P+N"]
f3l1ld = load [label: "PNL-1463", rating: "YARD LIGHTING / 27 kW"]
f3l2cb = breaker [label: "CB-359", rating: "MCCB / 20 A / 3P"]
f3l2m = motor [label: "MTR-1183", rating: "9 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
