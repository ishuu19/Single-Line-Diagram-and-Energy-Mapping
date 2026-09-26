sld "GEN-1514 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-449", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1615", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-367", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-723", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1421", rating: "DOCK PANEL / 27 kW"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1467", rating: "DOCK PANEL / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
