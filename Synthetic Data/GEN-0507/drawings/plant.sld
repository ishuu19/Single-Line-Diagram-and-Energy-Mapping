sld "GEN-0507 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1647", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-331", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-754", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
busB = bus [label: "BUS-431", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1605", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-327", rating: "MCCB / 800 A / 3P"]
mctB1 = ct [label: "TA-743", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
tie = bus_tie [label: "CB-325", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1404", rating: "CANOPY AUXILIARIES / 19 kW"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1440", rating: "DC FAST CHARGER BANK / 100 kW"]
f3cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-742", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1494", rating: "CANOPY AUXILIARIES / 20 kW"]

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
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
