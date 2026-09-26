sld "GEN-1277 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-414", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-383", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1197", rating: "28 kW / COND"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1496", rating: "PACKAGING PANEL / 10 kW"]
f2x = capacitor_bank [label: "CAP-671", rating: "172 kVAR"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
f2ct -> f2x
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
