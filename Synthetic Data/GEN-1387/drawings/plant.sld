sld "GEN-1387 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-414", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1626", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-737", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "UTILITY PANEL / 19 kW"]
f2cb = breaker [label: "CB-379", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-725", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-309", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1177", rating: "16 kW / COMP"]
f3cb = breaker [label: "CB-326", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-733", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-303", rating: "MCCB / 80 A / 3P"]
f3l1m = motor [label: "MTR-1197", rating: "32 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
