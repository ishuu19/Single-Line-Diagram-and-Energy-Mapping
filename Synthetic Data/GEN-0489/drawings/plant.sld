sld "GEN-0489 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-496", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1682", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-315", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-339", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-821", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1149", rating: "19 kW / AHU"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2pnl = hub [label: "FD-972", rating: "3P+N"]
f2l1ld = load [label: "PNL-1404", rating: "LIFE SAFETY BRANCH / 26 kW"]
f2l2cb = breaker [label: "CB-321", rating: "MCCB / 50 A / 3P"]
f2l2drv = vfd [label: "DRV-860", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1118", rating: "20 kW / AHU"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1478", rating: "LIFE SAFETY BRANCH / 52 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
