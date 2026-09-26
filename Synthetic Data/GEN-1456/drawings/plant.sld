sld "GEN-1456 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-421", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1696", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-377", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-732", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1421", rating: "ADMIN PANEL / 59 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1485", rating: "ADMIN PANEL / 32 kW"]
f3cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-707", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3pnl = hub [label: "FD-992", rating: "3P+N"]
f3l1ld = load [label: "PNL-1465", rating: "ADMIN PANEL / 33 kW"]
f3l2ld = load [label: "PNL-1416", rating: "ADMIN PANEL / 32 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
