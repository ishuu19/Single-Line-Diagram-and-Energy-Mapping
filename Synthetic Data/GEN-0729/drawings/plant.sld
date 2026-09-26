sld "GEN-0729 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-411", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1662", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
busB = bus [label: "BUS-491", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1628", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-392", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-756", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
tie = bus_tie [label: "CB-361", rating: "800 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-317", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1pnl = hub [label: "FD-958", rating: "3P+N"]
f1l1ld = load [label: "PNL-1497", rating: "SALES FLOOR LIGHTING / 20 kW"]
f1l2ld = load [label: "PNL-1453", rating: "SALES FLOOR LIGHTING / 46 kW"]
f2cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-368", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1172", rating: "15 kW / EF"]

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
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
