sld "GEN-0611 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1611", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-779", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-760", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-339", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-817", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1153", rating: "18 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
