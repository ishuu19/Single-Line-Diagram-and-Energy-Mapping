sld "GEN-0975 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-409", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1697", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "300 kW"]
mcbA2 = breaker [label: "CB-303", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-388", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1144", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-343", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f2pnl = hub [label: "FD-936", rating: "3P+N"]
f2l1ld = load [label: "PNL-1425", rating: "SHORE POWER PANEL / 69 kW"]
f2l2ld = load [label: "PNL-1424", rating: "SHORE POWER PANEL / 80 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
