sld "GEN-0497 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-463", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1648", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1457", rating: "LIFE SAFETY BRANCH / 56 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
