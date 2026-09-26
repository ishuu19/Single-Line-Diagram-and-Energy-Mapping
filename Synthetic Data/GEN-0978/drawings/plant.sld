sld "GEN-0978 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-411", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1636", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-359", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
busB = bus [label: "BUS-443", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1605", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-338", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-775", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
tie = bus_tie [label: "CB-369", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1189", rating: "27 kW / BLOW"]
f2cb = breaker [label: "CB-332", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2pnl = hub [label: "FD-923", rating: "3P+N"]
f2l1ld = load [label: "PNL-1441", rating: "DOSING PANEL / 24 kW"]
f2l2ld = load [label: "PNL-1458", rating: "DOSING PANEL / 33 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
