sld "GEN-1041 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-415", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1668", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1478", rating: "CONTROL PANEL / 22 kW"]
f2cb = breaker [label: "CB-349", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "GROW LIGHTING / 30 kW"]

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
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
