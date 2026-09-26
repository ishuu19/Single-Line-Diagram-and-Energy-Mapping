sld "GEN-0252 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-487", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1628", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-316", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-376", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1184", rating: "8 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
