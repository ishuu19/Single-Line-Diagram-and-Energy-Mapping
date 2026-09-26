sld "GEN-1298 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-414", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1629", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-314", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1494", rating: "TENANT PANEL / 42 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1452", rating: "FLOOR LIGHTING / 87 kW"]
f3cb = breaker [label: "CB-369", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-799", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-342", rating: "MCCB / 20 A / 3P"]
f3l1m = motor [label: "MTR-1164", rating: "8 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
