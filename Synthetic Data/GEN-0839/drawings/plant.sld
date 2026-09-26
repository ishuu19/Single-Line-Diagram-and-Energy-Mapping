sld "GEN-0839 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-477", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1680", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-325", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
busB = bus [label: "BUS-485", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1637", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-370", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-791", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
tie = bus_tie [label: "CB-383", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "AUXILIARY PANEL / 12 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "AUXILIARY PANEL / 14 kW"]
f3cb = breaker [label: "CB-301", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-787", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1494", rating: "ADMIN PANEL / 60 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
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
