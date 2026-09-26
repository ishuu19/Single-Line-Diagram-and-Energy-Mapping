sld "GEN-1201 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1637", rating: "2080 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
busB = bus [label: "BUS-413", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_dy [label: "TX-1678", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-355", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-717", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
tie = bus_tie [label: "CB-332", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1457", rating: "MCC AUXILIARY BOARD / 44 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-710", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1498", rating: "AUXILIARY PANEL / 477 kW"]
f3cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1410", rating: "MCC AUXILIARY BOARD / 40 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
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
