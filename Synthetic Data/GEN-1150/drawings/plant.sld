sld "GEN-1150 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1697", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-733", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-718", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "ACADEMIC BLOCK PANEL / 47 kW"]
f2cb = breaker [label: "CB-382", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1487", rating: "SITE LIGHTING / 17 kW"]
f3cb = breaker [label: "CB-315", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1494", rating: "SITE LIGHTING / 24 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
