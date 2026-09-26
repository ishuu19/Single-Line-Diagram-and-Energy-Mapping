sld "GEN-0255 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-485", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1645", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-753", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "130 kW"]
mcbA2 = breaker [label: "CB-380", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-777", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-751", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1441", rating: "CRITICAL BRANCH / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
