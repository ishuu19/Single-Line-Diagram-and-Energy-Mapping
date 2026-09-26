sld "GEN-1280 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1688", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
busB = bus [label: "BUS-405", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1630", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-396", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-709", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
tie = bus_tie [label: "CB-394", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1493", rating: "AUXILIARY PANEL / 19 kW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1427", rating: "AUXILIARY PANEL / 19 kW"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1457", rating: "AUXILIARY PANEL / 25 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
