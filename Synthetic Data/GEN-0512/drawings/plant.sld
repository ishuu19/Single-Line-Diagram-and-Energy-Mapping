sld "GEN-0512 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-419", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1640", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
busB = bus [label: "BUS-458", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
mcbB1 = breaker [label: "CB-326", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-702", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
tie = bus_tie [label: "CB-306", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-342", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-328", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1192", rating: "33 kW / COMP"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1458", rating: "SHOP LIGHTING / 19 kW"]
f2x = harmonic_filter [label: "HF-564", rating: "5th / 7th"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
f2ct -> f2x
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
