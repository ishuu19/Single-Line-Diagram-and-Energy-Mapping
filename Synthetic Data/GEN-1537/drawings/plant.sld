sld "GEN-1537 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-497", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1665", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-373", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-720", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
mcbA2 = breaker [label: "CB-340", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-782", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "DOSING PANEL / 34 kW"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1463", rating: "AUXILIARY PANEL / 73 kW"]
f3cb = breaker [label: "CB-332", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-733", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f3pnl = hub [label: "FD-956", rating: "3P+N"]
f3l1ld = load [label: "PNL-1495", rating: "DOSING PANEL / 21 kW"]
f3l2ld = load [label: "PNL-1487", rating: "AUXILIARY PANEL / 27 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
