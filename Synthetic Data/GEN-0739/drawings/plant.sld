sld "GEN-0739 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1617", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1pnl = hub [label: "FD-955", rating: "3P+N"]
f1l1ld = load [label: "PNL-1479", rating: "DC FAST CHARGER BANK / 230 kW"]
f1l2ld = load [label: "PNL-1427", rating: "DC FAST CHARGER BANK / 164 kW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-733", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1429", rating: "FORECOURT LIGHTING / 20 kW"]
f3cb = breaker [label: "CB-303", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-771", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1466", rating: "FORECOURT LIGHTING / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
