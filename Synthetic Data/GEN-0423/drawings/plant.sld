sld "GEN-0423 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-430", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-326", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
busB = bus [label: "BUS-466", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
mcbB1 = breaker [label: "CB-381", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-733", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
tie = bus_tie [label: "CB-325", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "WARD LIGHTING / 37 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-710", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1410", rating: "LIFE SAFETY BRANCH / 36 kW"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-706", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1400", rating: "AUXILIARY PANEL / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
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
