sld "GEN-0774 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-455", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-332", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-723", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_dy [label: "TX-1651", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-374", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-746", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1pnl = hub [label: "FD-956", rating: "3P+N"]
f1l1ld = load [label: "PNL-1404", rating: "AUXILIARY PANEL / 57 kW"]
f1l2ld = load [label: "PNL-1448", rating: "DOSING PANEL / 20 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "DOSING PANEL / 26 kW"]
f3cb = breaker [label: "CB-371", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1474", rating: "AUXILIARY PANEL / 27 kW"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
