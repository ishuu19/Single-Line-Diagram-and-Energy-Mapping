sld "GEN-0136 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-425", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1612", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1450", rating: "SHORE POWER PANEL / 46 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
