sld "GEN-0917 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-486", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1631", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-351", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1498", rating: "CONTROL PANEL / 11 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f2pnl = hub [label: "FD-949", rating: "3P+N"]
f2l1cb = breaker [label: "CB-316", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1108", rating: "29 kW / RWP"]
f2l2ld = load [label: "PNL-1493", rating: "GROW LIGHTING / 66 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-750", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1439", rating: "CONTROL PANEL / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
