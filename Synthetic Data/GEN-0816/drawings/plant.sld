sld "GEN-0816 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-452", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1655", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-799", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1466", rating: "YARD LIGHTING / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
