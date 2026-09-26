sld "GEN-0504 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-786", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1480", rating: "LIFE SAFETY BRANCH / 33 kW"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-770", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1496", rating: "WARD LIGHTING / 39 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
