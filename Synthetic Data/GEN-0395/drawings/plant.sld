sld "GEN-0395 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-481", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1610", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-372", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1474", rating: "REEFER RACK PANEL / 71 kW"]
f2cb = breaker [label: "CB-368", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-325", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1123", rating: "9 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
