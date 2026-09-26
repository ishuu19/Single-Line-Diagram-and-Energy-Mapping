sld "GEN-0050 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-425", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1698", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_yd [label: "TX-1685", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-300", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-776", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-325", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-356", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1177", rating: "13 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
