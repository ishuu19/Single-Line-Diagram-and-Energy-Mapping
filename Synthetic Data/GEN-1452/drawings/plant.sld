sld "GEN-1452 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-417", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
busB = bus [label: "BUS-484", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1669", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-351", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-734", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
tie = bus_tie [label: "CB-367", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1404", rating: "FLOOR LIGHTING / 82 kW"]
f2cb = breaker [label: "CB-381", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1481", rating: "AUXILIARY PANEL / 40 kW"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-740", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-316", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1103", rating: "7 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
