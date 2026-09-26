sld "GEN-0222 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-419", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1669", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-754", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
busB = bus [label: "BUS-439", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1644", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-305", rating: "MCCB / 1600 A / 3P"]
mctB1 = ct [label: "TA-716", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
tie = bus_tie [label: "CB-306", rating: "400 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1419", rating: "AUXILIARY PANEL / 28 kW"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1467", rating: "CELLAR PANEL / 20 kW"]
f3cb = breaker [label: "CB-303", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-734", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1417", rating: "AUXILIARY PANEL / 15 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
