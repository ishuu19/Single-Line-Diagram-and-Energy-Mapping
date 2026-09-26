sld "GEN-0891 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1647", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
busB = bus [label: "BUS-456", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1635", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-396", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-761", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
tie = bus_tie [label: "CB-314", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-398", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1114", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-336", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-307", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1150", rating: "19 kW / COND"]

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
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
