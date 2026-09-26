sld "GEN-1354 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-477", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 444 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-771", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "SITE LIGHTING / 23 kW"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-739", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1465", rating: "ACADEMIC BLOCK PANEL / 70 kW"]
f3cb = breaker [label: "CB-393", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-755", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f3l1drv = vfd [label: "DRV-856", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1117", rating: "31 kW / AHU"]

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
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
