sld "GEN-1067 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-492", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1601", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-712", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
busB = bus [label: "BUS-436", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1605", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-359", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-730", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
tie = bus_tie [label: "CB-321", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-708", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1456", rating: "CLASSROOM LIGHTING / 48 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1496", rating: "ADMIN PANEL / 46 kW"]
f3cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-733", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1410", rating: "AUXILIARY PANEL / 15 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
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
