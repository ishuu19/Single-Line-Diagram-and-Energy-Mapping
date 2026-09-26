sld "GEN-0181 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-498", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1613", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-309", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-768", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1pnl = hub [label: "FD-969", rating: "3P+N"]
f1l1ld = load [label: "PNL-1411", rating: "WARD LIGHTING / 23 kW"]
f1l2cb = breaker [label: "CB-381", rating: "MCCB / 80 A / 3P"]
f1l2drv = vfd [label: "DRV-898", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1187", rating: "33 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
f1ct -> f1pm
