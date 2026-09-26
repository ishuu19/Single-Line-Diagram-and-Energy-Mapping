sld "GEN-0365 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-792", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 456 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-341", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1193", rating: "19 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
