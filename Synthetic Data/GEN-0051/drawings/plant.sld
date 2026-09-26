sld "GEN-0051 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-336", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-338", rating: "MCCB / 80 A / 3P"]
f1l1m = motor [label: "MTR-1164", rating: "34 kW / COMP"]
f1x = harmonic_filter [label: "HF-528", rating: "5th / 7th"]
f2cb = breaker [label: "CB-364", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1406", rating: "PACKAGING PANEL / 30 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-740", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-385", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1189", rating: "26 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
f1ct -> f1x
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
