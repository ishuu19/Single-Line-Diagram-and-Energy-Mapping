sld "GEN-0593 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-489", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-373", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_yd [label: "TX-1638", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-308", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-792", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1477", rating: "AUXILIARY PANEL / 18 kW"]
f2cb = breaker [label: "CB-368", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f2pnl = hub [label: "FD-984", rating: "3P+N"]
f2l1ld = load [label: "PNL-1491", rating: "GROW LIGHTING / 72 kW"]
f2l2cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f2l2m = motor [label: "MTR-1119", rating: "29 kW / RWP"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-740", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1488", rating: "GROW LIGHTING / 39 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
