sld "GEN-1258 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1646", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-716", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "DOCK LIGHTING / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
