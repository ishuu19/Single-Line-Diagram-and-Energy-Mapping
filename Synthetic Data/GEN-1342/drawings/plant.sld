sld "GEN-1342 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1639", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1457", rating: "GROW LIGHTING / 38 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-718", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "CONTROL PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
