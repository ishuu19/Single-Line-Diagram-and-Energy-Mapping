sld "GEN-0068 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-458", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-329", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1405", rating: "CONTROL PANEL / 17 kW"]
f2cb = breaker [label: "CB-338", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1468", rating: "GROW LIGHTING / 71 kW"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-786", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1480", rating: "CONTROL PANEL / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
