sld "GEN-1535 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-727", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1467", rating: "LIFE SAFETY BRANCH / 32 kW"]
f2cb = breaker [label: "CB-391", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1483", rating: "LIFE SAFETY BRANCH / 42 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
