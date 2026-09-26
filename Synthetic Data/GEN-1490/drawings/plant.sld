sld "GEN-1490 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-457", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1664", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-370", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1487", rating: "SHORE POWER PANEL / 70 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1465", rating: "SHORE POWER PANEL / 30 kW"]
f3cb = breaker [label: "CB-373", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1491", rating: "DOCK LIGHTING / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
