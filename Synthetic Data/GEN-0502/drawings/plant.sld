sld "GEN-0502 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-456", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1658", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-720", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 365 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-313", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-741", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1pnl = hub [label: "FD-959", rating: "3P+N"]
f1l1ld = load [label: "PNL-1437", rating: "FORECOURT LIGHTING / 17 kW"]
f1l2ld = load [label: "PNL-1422", rating: "DC FAST CHARGER BANK / 160 kW"]
f2cb = breaker [label: "CB-325", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1427", rating: "DC FAST CHARGER BANK / 183 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
