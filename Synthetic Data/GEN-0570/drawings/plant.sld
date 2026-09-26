sld "GEN-0570 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1623", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-377", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-373", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-764", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1420", rating: "DOCK LIGHTING / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
