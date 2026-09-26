sld "GEN-0231 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-383", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-732", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-347", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1164", rating: "11 kW / EF"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-750", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1487", rating: "SHORE POWER PANEL / 48 kW"]
f3cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-738", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1400", rating: "SHORE POWER PANEL / 75 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
