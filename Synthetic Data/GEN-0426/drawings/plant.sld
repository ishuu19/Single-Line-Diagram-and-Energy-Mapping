sld "GEN-0426 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-413", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-382", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
busB = bus [label: "BUS-415", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1616", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-353", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-785", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
tie = bus_tie [label: "CB-375", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-302", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1480", rating: "AUXILIARY PANEL / 11 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "AUXILIARY PANEL / 55 kW"]
f3cb = breaker [label: "CB-301", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-734", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1418", rating: "UTILITY PANEL / 27 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
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
