sld "GEN-1371 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-488", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1678", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-375", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1137", rating: "22 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
