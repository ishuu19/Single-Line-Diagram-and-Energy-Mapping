sld "GEN-0519 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-413", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1690", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-775", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-306", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1137", rating: "15 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
