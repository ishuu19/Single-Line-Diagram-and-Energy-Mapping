sld "GEN-1271 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-392", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-360", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-870", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1184", rating: "48 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
