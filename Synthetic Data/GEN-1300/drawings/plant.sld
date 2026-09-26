sld "GEN-1300 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-350", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1116", rating: "30 kW / COND"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
