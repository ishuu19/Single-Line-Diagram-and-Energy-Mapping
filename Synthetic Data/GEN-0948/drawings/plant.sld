sld "GEN-0948 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1693", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-307", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1167", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1414", rating: "HOUSE PANEL / 45 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
