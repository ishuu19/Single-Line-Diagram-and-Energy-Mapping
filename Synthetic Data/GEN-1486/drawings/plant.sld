sld "GEN-1486 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-403", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1602", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-311", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1413", rating: "DC FAST CHARGER BANK / 229 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
