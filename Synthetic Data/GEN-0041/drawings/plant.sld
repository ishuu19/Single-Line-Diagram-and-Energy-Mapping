sld "GEN-0041 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-497", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1630", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_dy [label: "TX-1628", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-361", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-735", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1479", rating: "CRITICAL BRANCH / 72 kW"]
f2cb = breaker [label: "CB-343", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1472", rating: "LIFE SAFETY BRANCH / 25 kW"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1460", rating: "CRITICAL BRANCH / 52 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
