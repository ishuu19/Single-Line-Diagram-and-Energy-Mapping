sld "GEN-0083 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-428", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-399", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-758", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-350", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1110", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-372", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-309", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1137", rating: "7 kW / EF"]
f3cb = breaker [label: "CB-394", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-780", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-328", rating: "MCCB / 40 A / 3P"]
f3l1m = motor [label: "MTR-1195", rating: "9 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
