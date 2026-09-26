sld "GEN-0444 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1685", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-354", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1125", rating: "22 kW / RWP"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-786", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-342", rating: "MCCB / 20 A / 3P"]
f2l1drv = vfd [label: "DRV-820", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1128", rating: "9 kW / EF"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-390", rating: "MCCB / 40 A / 3P"]
f3l1m = motor [label: "MTR-1194", rating: "16 kW / RWP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
