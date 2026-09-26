sld "GEN-1110 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1662", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-796", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1456", rating: "ADMIN PANEL / 80 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
