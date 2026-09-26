sld "GEN-0349 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-425", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-300", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-395", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1184", rating: "11 kW / EF"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-322", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1108", rating: "13 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
