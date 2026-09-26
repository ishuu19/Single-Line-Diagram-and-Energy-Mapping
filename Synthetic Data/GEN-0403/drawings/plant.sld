sld "GEN-0403 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1649", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
busB = bus [label: "BUS-495", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_dy [label: "TX-1686", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-355", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-746", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
tie = bus_tie [label: "CB-323", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-315", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1480", rating: "AUXILIARY PANEL / 22 kW"]
f2cb = breaker [label: "CB-354", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-762", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "AUXILIARY PANEL / 17 kW"]
f3cb = breaker [label: "CB-399", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1426", rating: "GROW LIGHTING / 62 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
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
