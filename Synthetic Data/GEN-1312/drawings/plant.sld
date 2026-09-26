sld "GEN-1312 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-430", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1661", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-783", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_yd [label: "TX-1616", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-371", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-745", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1445", rating: "DOSING PANEL / 40 kW"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1487", rating: "AUXILIARY PANEL / 16 kW"]
f3cb = breaker [label: "CB-339", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-794", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f3pnl = hub [label: "FD-911", rating: "3P+N"]
f3l1ld = load [label: "PNL-1462", rating: "DOSING PANEL / 23 kW"]
f3l2ld = load [label: "PNL-1400", rating: "AUXILIARY PANEL / 62 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
