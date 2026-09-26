sld "GEN-1366 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1622", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-311", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1430", rating: "CANOPY AUXILIARIES / 23 kW"]
f2cb = breaker [label: "CB-376", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1477", rating: "CANOPY AUXILIARIES / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
