sld "GEN-1013 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-448", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1658", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "YARD LIGHTING / 23 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-760", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1430", rating: "YARD LIGHTING / 27 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
