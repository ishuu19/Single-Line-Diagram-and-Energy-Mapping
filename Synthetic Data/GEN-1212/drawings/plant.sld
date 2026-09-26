sld "GEN-1212 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-411", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1635", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-382", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-378", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1438", rating: "REEFER RACK PANEL / 137 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
