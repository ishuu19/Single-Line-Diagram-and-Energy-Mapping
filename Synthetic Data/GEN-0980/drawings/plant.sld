sld "GEN-0980 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-346", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1107", rating: "15 kW / RWP"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1422", rating: "GROW LIGHTING / 48 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
