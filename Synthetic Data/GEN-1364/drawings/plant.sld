sld "GEN-1364 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-449", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1669", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-345", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-784", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1457", rating: "YARD LIGHTING / 25 kW"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1402", rating: "REEFER RACK PANEL / 86 kW"]
f3cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-754", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1127", rating: "14 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
