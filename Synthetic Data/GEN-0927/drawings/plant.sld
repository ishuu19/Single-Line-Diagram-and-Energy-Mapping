sld "GEN-0927 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-431", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1628", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-343", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-737", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-313", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1137", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-760", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-356", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1144", rating: "15 kW / COND"]
f3cb = breaker [label: "CB-373", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-798", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1456", rating: "DOCK PANEL / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
