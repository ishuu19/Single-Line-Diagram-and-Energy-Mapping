sld "GEN-1148 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-412", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1639", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
busB = bus [label: "BUS-405", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1625", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-320", rating: "MCCB / 800 A / 3P"]
mctB1 = ct [label: "TA-764", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
tie = bus_tie [label: "CB-333", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1489", rating: "AUXILIARY PANEL / 13 kW"]
f2cb = breaker [label: "CB-399", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "AUXILIARY PANEL / 11 kW"]
f3cb = breaker [label: "CB-357", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-702", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1430", rating: "AUXILIARY PANEL / 28 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
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
