sld "GEN-0996 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-377", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1482", rating: "CONTROL PANEL / 25 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-337", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1171", rating: "20 kW / RWP"]
f3cb = breaker [label: "CB-396", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-702", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1491", rating: "GROW LIGHTING / 61 kW"]

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
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
