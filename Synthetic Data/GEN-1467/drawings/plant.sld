sld "GEN-1467 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1680", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-377", rating: "MCCB / 1600 A / 3P"]
mctA2 = ct [label: "TA-729", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 346 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-374", rating: "MCCB / 800 A / 3P"]
mctA3 = ct [label: "TA-754", rating: "3 CTs / 800/5 A"]
mpmA3 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-366", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1407", rating: "AUXILIARY PANEL / 17 kW"]
f2cb = breaker [label: "CB-372", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-795", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1409", rating: "AUXILIARY PANEL / 25 kW"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
