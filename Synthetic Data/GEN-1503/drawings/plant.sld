sld "GEN-1503 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-428", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1672", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-764", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-385", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1153", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1191", rating: "16 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
