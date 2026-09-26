sld "GEN-0238 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-443", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1659", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-364", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-776", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 333 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-397", rating: "MCCB / 800 A / 3P"]
mctA2 = ct [label: "TA-719", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1484", rating: "SITE LIGHTING / 28 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-773", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1494", rating: "SITE LIGHTING / 19 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
