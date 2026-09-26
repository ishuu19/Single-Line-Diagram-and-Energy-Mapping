sld "GEN-1464 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-491", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1617", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-377", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1pnl = hub [label: "FD-967", rating: "3P+N"]
f1l1ld = load [label: "PNL-1407", rating: "ADMIN PANEL / 80 kW"]
f1l2cb = breaker [label: "CB-390", rating: "MCCB / 25 A / 3P"]
f1l2m = motor [label: "MTR-1130", rating: "11 kW / EF"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "ADMIN PANEL / 57 kW"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-754", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1000", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1454", rating: "CLASSROOM LIGHTING / 38 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
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
