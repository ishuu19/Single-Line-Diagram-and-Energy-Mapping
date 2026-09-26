sld "GEN-0105 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-410", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1662", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-343", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1429", rating: "YARD LIGHTING / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
