sld "GEN-0876 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1654", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
busB = bus [label: "BUS-459", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1672", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-388", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-746", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
tie = bus_tie [label: "CB-392", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1473", rating: "CONTROL PANEL / 24 kW"]
f2cb = breaker [label: "CB-377", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-769", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1493", rating: "CONTROL PANEL / 17 kW"]
f3cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1468", rating: "GROW LIGHTING / 45 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
