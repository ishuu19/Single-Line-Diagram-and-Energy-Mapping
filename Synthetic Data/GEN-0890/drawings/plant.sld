sld "GEN-0890 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-443", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1673", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-397", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1cb = breaker [label: "CB-353", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-355", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1198", rating: "13 kW / EF"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2pnl = hub [label: "FD-996", rating: "3P+N"]
f2l1ld = load [label: "PNL-1401", rating: "SHORE POWER PANEL / 50 kW"]
f2l2ld = load [label: "PNL-1407", rating: "DOCK LIGHTING / 22 kW"]
f3cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-713", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1441", rating: "DOCK LIGHTING / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
