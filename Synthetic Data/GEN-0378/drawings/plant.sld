sld "GEN-0378 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-487", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1623", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-306", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
busB = bus [label: "BUS-473", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_yd [label: "TX-1647", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-359", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-726", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
tie = bus_tie [label: "CB-318", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1414", rating: "CLASSROOM LIGHTING / 26 kW"]
f2cb = breaker [label: "CB-325", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1445", rating: "AUXILIARY PANEL / 21 kW"]
f3cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-758", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1441", rating: "AUXILIARY PANEL / 15 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
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
