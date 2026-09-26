sld "GEN-1036 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1652", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-380", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-752", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-362", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1195", rating: "20 kW / COMP"]
f2cb = breaker [label: "CB-351", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-716", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-357", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1183", rating: "19 kW / COND"]
f3cb = breaker [label: "CB-389", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-347", rating: "MCCB / 50 A / 3P"]
f3l1m = motor [label: "MTR-1125", rating: "23 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
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
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
