sld "GEN-1236 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1623", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
busB = bus [label: "BUS-457", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1664", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-320", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-774", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
tie = bus_tie [label: "CB-367", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "YARD LIGHTING / 34 kW"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "YARD LIGHTING / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
