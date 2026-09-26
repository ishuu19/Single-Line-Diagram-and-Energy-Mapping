sld "GEN-0134 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-434", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1690", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-389", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-762", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
busB = bus [label: "BUS-448", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_yd [label: "TX-1619", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-347", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-744", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
tie = bus_tie [label: "CB-344", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1pnl = hub [label: "FD-990", rating: "3P+N"]
f1l1ld = load [label: "PNL-1475", rating: "CANOPY AUXILIARIES / 16 kW"]
f1l2ld = load [label: "PNL-1473", rating: "DC FAST CHARGER BANK / 239 kW"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-764", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1415", rating: "CANOPY AUXILIARIES / 17 kW"]

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
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
