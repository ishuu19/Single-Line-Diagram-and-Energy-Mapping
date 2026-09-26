sld "GEN-0925 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-396", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 578 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-392", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-724", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1pnl = hub [label: "FD-914", rating: "3P+N"]
f1l1ld = load [label: "PNL-1463", rating: "ACADEMIC BLOCK PANEL / 75 kW"]
f1l2ld = load [label: "PNL-1454", rating: "ACADEMIC BLOCK PANEL / 91 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-714", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2pnl = hub [label: "FD-986", rating: "3P+N"]
f2l1ld = load [label: "PNL-1441", rating: "SITE LIGHTING / 21 kW"]
f2l2ld = load [label: "PNL-1444", rating: "SITE LIGHTING / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
