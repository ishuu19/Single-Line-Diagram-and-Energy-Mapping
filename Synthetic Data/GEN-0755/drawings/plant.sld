sld "GEN-0755 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-415", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-371", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-755", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
busB = bus [label: "BUS-406", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1638", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-391", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-754", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
tie = bus_tie [label: "CB-363", rating: "800 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-361", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1107", rating: "8 kW / EF"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1486", rating: "DOCK PANEL / 22 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
