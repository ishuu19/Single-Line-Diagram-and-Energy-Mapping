sld "GEN-0211 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1651", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
busB = bus [label: "BUS-440", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1605", rating: "110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-333", rating: "ACB / 160 A / 3P"]
mctB1 = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
mpmB1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
tie = bus_tie [label: "CB-305", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "AUXILIARY PANEL / 10 kW"]
f2cb = breaker [label: "CB-325", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1474", rating: "SHELTER LIGHTING / 10 kW"]
f3cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1468", rating: "SHELTER LIGHTING / 8 kW"]

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
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
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
