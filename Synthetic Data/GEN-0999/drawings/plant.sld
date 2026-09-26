sld "GEN-0999 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1636", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-347", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-372", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1426", rating: "SITE LIGHTING / 15 kW"]
f2cb = breaker [label: "CB-349", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1411", rating: "ACADEMIC BLOCK PANEL / 53 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
