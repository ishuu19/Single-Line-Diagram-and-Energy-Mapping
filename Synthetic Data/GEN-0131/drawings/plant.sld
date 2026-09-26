sld "GEN-0131 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-409", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1629", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-397", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
busB = bus [label: "BUS-427", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1694", rating: "140 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-308", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
tie = bus_tie [label: "CB-393", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-791", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "DOSING PANEL / 18 kW"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2pnl = hub [label: "FD-990", rating: "3P+N"]
f2l1ld = load [label: "PNL-1477", rating: "DOSING PANEL / 33 kW"]
f2l2ld = load [label: "PNL-1492", rating: "DOSING PANEL / 25 kW"]

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
f1ct -> f1l1ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
