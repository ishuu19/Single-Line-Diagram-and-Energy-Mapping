sld "GEN-0724 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-463", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1651", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
busB = bus [label: "BUS-499", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "500 kW"]
mcbB1 = breaker [label: "CB-343", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-771", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
tie = ats [label: "CB-308", rating: "1000 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1421", rating: "AUXILIARY PANEL / 41 kW"]
f2cb = breaker [label: "CB-300", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-786", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1447", rating: "FLOOR LIGHTING / 42 kW"]
f3cb = breaker [label: "CB-358", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-705", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1460", rating: "FLOOR LIGHTING / 69 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
