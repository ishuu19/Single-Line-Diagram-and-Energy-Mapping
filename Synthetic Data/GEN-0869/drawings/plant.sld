sld "GEN-0869 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1614", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-321", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
mcbA2 = breaker [label: "CB-375", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1421", rating: "REEFER RACK PANEL / 147 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
