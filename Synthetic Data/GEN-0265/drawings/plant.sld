sld "GEN-0265 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-447", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1616", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-390", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f1cb = breaker [label: "CB-326", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-317", rating: "MCCB / 400 A / 3P"]
f1l1drv = vfd [label: "DRV-891", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1103", rating: "87 kW / COMP"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-724", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-351", rating: "MCCB / 125 A / 3P"]
f2l1m = motor [label: "MTR-1186", rating: "27 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
