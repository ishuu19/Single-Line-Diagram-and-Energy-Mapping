sld "GEN-0719 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-482", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1633", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1pnl = hub [label: "FD-967", rating: "3P+N"]
f1l1ld = load [label: "PNL-1492", rating: "SHOP AUXILIARIES / 47 kW"]
f1l2ld = load [label: "PNL-1457", rating: "SHOP LIGHTING / 29 kW"]
f1x = capacitor_bank [label: "CAP-683", rating: "100 kVAR"]
f2cb = breaker [label: "CB-309", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1458", rating: "SHOP AUXILIARIES / 44 kW"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3pnl = hub [label: "FD-912", rating: "3P+N"]
f3l1ld = load [label: "PNL-1463", rating: "SHOP AUXILIARIES / 20 kW"]
f3l2ld = load [label: "PNL-1441", rating: "SHOP AUXILIARIES / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
f1pnl -> f1x
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
