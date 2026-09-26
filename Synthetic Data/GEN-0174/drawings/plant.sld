sld "GEN-0174 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1694", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-337", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-376", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1102", rating: "13 kW / EF"]

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
