sld "GEN-0309 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-439", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
busB = bus [label: "BUS-460", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1644", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-313", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-709", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
tie = bus_tie [label: "CB-354", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "MCC AUXILIARY BOARD / 55 kW"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1421", rating: "AUXILIARY PANEL / 118 kW"]
f3cb = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1430", rating: "AUXILIARY PANEL / 96 kW"]

srcA1 -> mcbA1
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
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
