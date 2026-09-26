sld "GEN-1178 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1626", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
busB = bus [label: "BUS-452", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1675", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-383", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-777", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
tie = bus_tie [label: "CB-336", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-769", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1pnl = hub [label: "FD-902", rating: "3P+N"]
f1l1ld = load [label: "PNL-1441", rating: "FORECOURT LIGHTING / 25 kW"]
f1l2ld = load [label: "PNL-1431", rating: "FORECOURT LIGHTING / 24 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "FORECOURT LIGHTING / 12 kW"]

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
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
