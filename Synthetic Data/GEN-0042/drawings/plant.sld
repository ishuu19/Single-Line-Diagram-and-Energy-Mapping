sld "GEN-0042 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-415", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1657", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-349", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
busB = bus [label: "BUS-432", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1673", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-383", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
tie = bus_tie [label: "CB-366", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1pnl = hub [label: "FD-986", rating: "3P+N"]
f1l1ld = load [label: "PNL-1483", rating: "AUXILIARY PANEL / 13 kW"]
f1l2ld = load [label: "PNL-1420", rating: "AUXILIARY PANEL / 7 kW"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-354", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1150", rating: "18 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
