sld "GEN-0556 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-497", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1687", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-307", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
busB = bus [label: "BUS-475", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1657", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-348", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
tie = bus_tie [label: "CB-314", rating: "800 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "AUXILIARY PANEL / 32 kW"]
f2cb = breaker [label: "CB-311", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1493", rating: "AUXILIARY PANEL / 45 kW"]
f2x = capacitor_bank [label: "CAP-600", rating: "162 kVAR"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
f2ct -> f2x
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
