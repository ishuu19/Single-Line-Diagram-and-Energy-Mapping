sld "GEN-0275 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1647", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_dy [label: "TX-1678", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-369", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-778", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 488 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-307", rating: "MCCB / 160 A / 3P"]
mctA3 = ct [label: "TA-781", rating: "3 CTs / 160/5 A"]
mpmA3 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-783", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1482", rating: "ACADEMIC BLOCK PANEL / 98 kW"]
f2cb = breaker [label: "CB-375", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1484", rating: "ACADEMIC BLOCK PANEL / 83 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
