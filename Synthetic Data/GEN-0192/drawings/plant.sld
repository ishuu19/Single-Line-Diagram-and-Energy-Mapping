sld "GEN-0192 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-459", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1650", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-344", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-762", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1427", rating: "COMMON AREA LIGHTING / 53 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
