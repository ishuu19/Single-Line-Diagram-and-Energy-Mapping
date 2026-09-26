sld "GEN-0746 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-333", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1192", rating: "15 kW / COMP"]
f2cb = breaker [label: "CB-390", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-341", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1139", rating: "29 kW / COND"]
f3cb = breaker [label: "CB-359", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-734", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1126", rating: "30 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
