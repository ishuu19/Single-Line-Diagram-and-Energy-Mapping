sld "GEN-0138 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-439", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-391", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1166", rating: "12 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
