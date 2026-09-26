sld "GEN-0346 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-471", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1639", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-775", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1455", rating: "LIFE SAFETY BRANCH / 54 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-335", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-810", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1100", rating: "26 kW / AHU"]
f3cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-722", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1451", rating: "LIFE SAFETY BRANCH / 39 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
