sld "GEN-1099 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-483", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1631", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-328", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1479", rating: "DOCK LIGHTING / 18 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
