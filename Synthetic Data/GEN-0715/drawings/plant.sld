sld "GEN-0715 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1631", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-399", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-376", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1125", rating: "6 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
