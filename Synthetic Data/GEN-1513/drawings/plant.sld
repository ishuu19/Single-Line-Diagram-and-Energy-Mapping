sld "GEN-1513 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-405", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1685", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-359", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "DC FAST CHARGER BANK / 237 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
