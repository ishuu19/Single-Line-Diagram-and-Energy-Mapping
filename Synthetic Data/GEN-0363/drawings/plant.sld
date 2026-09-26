sld "GEN-0363 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-405", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-396", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "YARD LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-723", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-332", rating: "MCCB / 50 A / 3P"]
f2l1m = motor [label: "MTR-1164", rating: "12 kW / EF"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
