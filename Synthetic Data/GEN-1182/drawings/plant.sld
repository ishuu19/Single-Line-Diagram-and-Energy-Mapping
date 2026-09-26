sld "GEN-1182 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1609", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-368", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-702", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-333", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1187", rating: "13 kW / EF"]
f2cb = breaker [label: "CB-307", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-369", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1147", rating: "7 kW / EF"]

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
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
