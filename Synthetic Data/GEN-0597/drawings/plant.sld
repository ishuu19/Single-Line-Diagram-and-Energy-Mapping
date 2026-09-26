sld "GEN-0597 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 546 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-386", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-754", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-309", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1114", rating: "25 kW / RWP"]
f2cb = breaker [label: "CB-337", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1193", rating: "28 kW / RWP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
