sld "GEN-0811 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-400", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
mcbA2 = breaker [label: "CB-301", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-781", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1463", rating: "DC FAST CHARGER BANK / 220 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-727", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1400", rating: "DC FAST CHARGER BANK / 137 kW"]
f3cb = breaker [label: "CB-399", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-716", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1465", rating: "DC FAST CHARGER BANK / 99 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
