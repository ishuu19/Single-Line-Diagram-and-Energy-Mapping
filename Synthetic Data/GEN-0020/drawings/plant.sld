sld "GEN-0020 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-419", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1661", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-368", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
busB = bus [label: "BUS-412", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "400 kW"]
mcbB1 = breaker [label: "CB-366", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-792", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
tie = ats [label: "CB-301", rating: "1000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1406", rating: "AUXILIARY PANEL / 8 kW"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1484", rating: "AUXILIARY PANEL / 11 kW"]
f3cb = breaker [label: "CB-394", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1426", rating: "AUXILIARY PANEL / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
