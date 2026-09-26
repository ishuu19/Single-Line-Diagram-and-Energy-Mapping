sld "GEN-1408 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-421", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
busB = bus [label: "BUS-407", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_yd [label: "TX-1627", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-344", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-770", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
tie = bus_tie [label: "CB-310", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-707", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1416", rating: "AUXILIARY PANEL / 8 kW"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-742", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1495", rating: "AUXILIARY PANEL / 37 kW"]
f3cb = breaker [label: "CB-342", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-755", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1434", rating: "AUXILIARY PANEL / 5 kW"]

srcA1 -> mcbA1
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
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
