sld "GEN-0872 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-434", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-794", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
busB = bus [label: "BUS-400", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
mcbB1 = breaker [label: "CB-314", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-728", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
tie = bus_tie [label: "CB-399", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1421", rating: "SALES FLOOR LIGHTING / 33 kW"]
f2cb = breaker [label: "CB-348", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1408", rating: "HOUSE PANEL / 44 kW"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1418", rating: "SALES FLOOR LIGHTING / 41 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
