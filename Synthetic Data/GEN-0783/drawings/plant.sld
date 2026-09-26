sld "GEN-0783 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1636", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1679", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-355", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-776", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 148 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-371", rating: "MCCB / 400 A / 3P"]
mctA3 = ct [label: "TA-795", rating: "3 CTs / 400/5 A"]
mpmA3 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1pnl = hub [label: "FD-947", rating: "3P+N"]
f1l1ld = load [label: "PNL-1435", rating: "SITE LIGHTING / 25 kW"]
f1l2ld = load [label: "PNL-1465", rating: "ACADEMIC BLOCK PANEL / 50 kW"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1406", rating: "AUXILIARY PANEL / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
