sld "GEN-1460 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-438", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-388", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-367", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1106", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1429", rating: "RISER PANEL / 72 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
