sld "GEN-0661 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-411", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
busB = bus [label: "BUS-412", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1667", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-373", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-743", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
tie = bus_tie [label: "CB-375", rating: "400 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1432", rating: "COMMON AREA LIGHTING / 22 kW"]
f2cb = breaker [label: "CB-320", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-757", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1424", rating: "RISER PANEL / 72 kW"]
f3cb = breaker [label: "CB-343", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-795", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1433", rating: "AUXILIARY PANEL / 17 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
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
