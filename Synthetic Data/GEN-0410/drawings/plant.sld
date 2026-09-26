sld "GEN-0410 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-494", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1633", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 493 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-333", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "GROW LIGHTING / 60 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-361", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1147", rating: "22 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
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
