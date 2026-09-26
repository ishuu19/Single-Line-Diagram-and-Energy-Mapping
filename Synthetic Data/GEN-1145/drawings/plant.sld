sld "GEN-1145 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-430", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1665", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
busB = bus [label: "BUS-440", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1638", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-314", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-708", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
tie = bus_tie [label: "CB-331", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-733", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1466", rating: "LIFE SAFETY BRANCH / 33 kW"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1484", rating: "LIFE SAFETY BRANCH / 28 kW"]
f3cb = breaker [label: "CB-303", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-777", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1452", rating: "LIFE SAFETY BRANCH / 55 kW"]

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
