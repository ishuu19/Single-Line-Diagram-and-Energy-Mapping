sld "GEN-0360 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-400", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1638", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
busB = bus [label: "BUS-480", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1627", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-389", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-777", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
tie = bus_tie [label: "CB-382", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1460", rating: "ACADEMIC BLOCK PANEL / 45 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-758", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1449", rating: "SITE LIGHTING / 20 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
