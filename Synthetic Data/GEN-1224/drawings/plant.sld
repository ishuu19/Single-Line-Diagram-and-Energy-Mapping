sld "GEN-1224 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1459", rating: "UTILITY PANEL / 10 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
