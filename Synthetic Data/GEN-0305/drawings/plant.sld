sld "GEN-0305 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-479", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1627", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-320", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 515 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-789", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1463", rating: "CLASSROOM LIGHTING / 48 kW"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-358", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1103", rating: "8 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
