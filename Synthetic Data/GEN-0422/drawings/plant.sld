sld "GEN-0422 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-475", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1635", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
busB = bus [label: "BUS-482", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1665", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-305", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-762", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
tie = bus_tie [label: "CB-372", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1pnl = hub [label: "FD-954", rating: "3P+N"]
f1l1cb = breaker [label: "CB-374", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-849", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1182", rating: "33 kW / AHU"]
f1l2ld = load [label: "PNL-1442", rating: "WARD LIGHTING / 21 kW"]
f2cb = breaker [label: "CB-368", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1452", rating: "CRITICAL BRANCH / 31 kW"]

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
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
