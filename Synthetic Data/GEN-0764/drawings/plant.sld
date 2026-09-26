sld "GEN-0764 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-349", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-310", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1170", rating: "13 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
