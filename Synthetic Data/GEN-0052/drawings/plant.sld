sld "GEN-0052 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-455", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1607", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-386", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-331", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1194", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1435", rating: "CLASSROOM LIGHTING / 49 kW"]
f3cb = breaker [label: "CB-357", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-720", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1449", rating: "CLASSROOM LIGHTING / 49 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
