sld "GEN-1359 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-470", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1608", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-759", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
busB = bus [label: "BUS-448", voltage: "208Y/120V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "208Y/120V", rating: "80 kW"]
mcbB1 = breaker [label: "CB-388", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-762", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
tie = ats [label: "CB-319", rating: "1600 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-385", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1482", rating: "SHOP LIGHTING / 27 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-727", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1421", rating: "SHOP AUXILIARIES / 23 kW"]
f3cb = breaker [label: "CB-354", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-700", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1420", rating: "AUXILIARY PANEL / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
