sld "GEN-1286 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-468", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1683", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-386", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-314", rating: "MCCB / 100 A / 3P"]
f1l1drv = vfd [label: "DRV-849", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1123", rating: "25 kW / AHU"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1463", rating: "LIFE SAFETY BRANCH / 45 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
