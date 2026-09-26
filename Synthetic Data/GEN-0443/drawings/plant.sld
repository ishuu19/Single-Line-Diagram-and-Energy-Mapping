sld "GEN-0443 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-453", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1656", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1pnl = hub [label: "FD-941", rating: "3P+N"]
f1l1ld = load [label: "PNL-1481", rating: "TENANT PANEL / 41 kW"]
f1l2ld = load [label: "PNL-1406", rating: "AUXILIARY PANEL / 29 kW"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2pnl = hub [label: "FD-959", rating: "3P+N"]
f2l1ld = load [label: "PNL-1493", rating: "AUXILIARY PANEL / 36 kW"]
f2l2cb = breaker [label: "CB-300", rating: "MCCB / 16 A / 3P"]
f2l2m = motor [label: "MTR-1155", rating: "7 kW / EF"]
f3cb = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f3pnl = hub [label: "FD-954", rating: "3P+N"]
f3l1ld = load [label: "PNL-1425", rating: "FLOOR LIGHTING / 37 kW"]
f3l2ld = load [label: "PNL-1462", rating: "FLOOR LIGHTING / 34 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
