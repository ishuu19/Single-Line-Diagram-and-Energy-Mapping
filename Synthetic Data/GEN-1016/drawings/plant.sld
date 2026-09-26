sld "GEN-1016 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-448", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1697", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
busB = bus [label: "BUS-439", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1604", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-317", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-726", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
tie = bus_tie [label: "CB-378", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1424", rating: "AUXILIARY PANEL / 35 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1477", rating: "AUXILIARY PANEL / 30 kW"]
f3cb = breaker [label: "CB-376", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1425", rating: "AUXILIARY PANEL / 9 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
