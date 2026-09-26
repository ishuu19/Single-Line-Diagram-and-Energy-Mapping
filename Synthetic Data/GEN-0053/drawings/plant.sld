sld "GEN-0053 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-422", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-392", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
busB = bus [label: "BUS-432", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1693", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-339", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-717", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
tie = bus_tie [label: "CB-328", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1479", rating: "AUXILIARY PANEL / 10 kW"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1495", rating: "SALES FLOOR LIGHTING / 29 kW"]
f3cb = breaker [label: "CB-370", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1460", rating: "HOUSE PANEL / 46 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
