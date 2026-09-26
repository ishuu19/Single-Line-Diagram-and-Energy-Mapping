sld "GEN-1501 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-394", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1171", rating: "9 kW / EF"]
f2cb = breaker [label: "CB-332", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-311", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1144", rating: "7 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
