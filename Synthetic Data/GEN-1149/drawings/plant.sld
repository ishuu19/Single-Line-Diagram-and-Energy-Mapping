sld "GEN-1149 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-439", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "2080 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-764", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
busB = bus [label: "BUS-456", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1664", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-340", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-711", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
tie = bus_tie [label: "CB-313", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-730", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1468", rating: "AUXILIARY PANEL / 153 kW"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1450", rating: "MCC AUXILIARY BOARD / 60 kW"]
f3cb = breaker [label: "CB-342", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1418", rating: "MCC AUXILIARY BOARD / 60 kW"]

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
