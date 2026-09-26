sld "GEN-0459 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1652", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "MCCB / 250 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1447", rating: "PACKAGING PANEL / 17 kW"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-742", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1459", rating: "PACKAGING PANEL / 19 kW"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-309", rating: "MCCB / 125 A / 3P"]
f3l1m = motor [label: "MTR-1157", rating: "54 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
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
