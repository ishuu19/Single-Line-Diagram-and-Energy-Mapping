sld "GEN-0771 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-494", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1685", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-354", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "500 kW"]
mcbA2 = breaker [label: "CB-323", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-707", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 566 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-333", rating: "MCCB / 400 A / 3P"]
mctA3 = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
mpmA3 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1498", rating: "AUXILIARY PANEL / 10 kW"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1459", rating: "AUXILIARY PANEL / 29 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
