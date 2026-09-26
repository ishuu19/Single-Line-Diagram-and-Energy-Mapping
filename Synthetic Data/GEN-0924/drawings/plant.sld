sld "GEN-0924 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-429", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1658", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-369", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
busB = bus [label: "BUS-442", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1659", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-338", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-718", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
tie = bus_tie [label: "CB-386", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1445", rating: "MCC AUXILIARY BOARD / 67 kW"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1432", rating: "AUXILIARY PANEL / 541 kW"]
f3cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-750", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1449", rating: "AUXILIARY PANEL / 78 kW"]

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
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
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
