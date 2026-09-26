sld "GEN-1436 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1607", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-379", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "CRITICAL BRANCH / 36 kW"]
f2cb = breaker [label: "CB-394", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1409", rating: "CRITICAL BRANCH / 54 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
