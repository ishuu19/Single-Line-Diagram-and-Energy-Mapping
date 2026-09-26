sld "GEN-1103 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-457", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f1cb = breaker [label: "CB-368", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1404", rating: "LIFE SAFETY BRANCH / 59 kW"]
f2cb = breaker [label: "CB-311", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-753", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1480", rating: "CRITICAL BRANCH / 69 kW"]
f3cb = breaker [label: "CB-366", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-726", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-346", rating: "MCCB / 80 A / 3P"]
f3l1drv = vfd [label: "DRV-817", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1163", rating: "34 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
