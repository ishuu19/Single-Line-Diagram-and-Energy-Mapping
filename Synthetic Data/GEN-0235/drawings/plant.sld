sld "GEN-0235 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-492", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1612", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-327", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-752", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
busB = bus [label: "BUS-467", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_yd [label: "TX-1641", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-391", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-748", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
tie = bus_tie [label: "CB-331", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "AUXILIARY PANEL / 164 kW"]
f2cb = breaker [label: "CB-349", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1437", rating: "AUXILIARY PANEL / 253 kW"]
f3cb = breaker [label: "CB-304", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1460", rating: "AUXILIARY PANEL / 397 kW"]

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
