sld "GEN-1189 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-446", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-392", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
srcA2 = utility [label: "6.6kV STANDBY", voltage: "6.6kV"]
mcbA2 = breaker [label: "CB-386", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-796", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1484", rating: "YARD LIGHTING / 34 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
