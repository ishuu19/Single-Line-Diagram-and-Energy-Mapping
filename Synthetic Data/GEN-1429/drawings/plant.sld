sld "GEN-1429 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-412", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-354", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-394", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-336", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1192", rating: "18 kW / RWP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
