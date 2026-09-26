sld "GEN-0651 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-465", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1684", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-716", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1439", rating: "FORECOURT LIGHTING / 14 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
