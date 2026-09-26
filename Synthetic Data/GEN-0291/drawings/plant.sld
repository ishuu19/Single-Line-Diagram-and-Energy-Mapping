sld "GEN-0291 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-447", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1645", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-372", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-780", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1410", rating: "HOUSE PANEL / 69 kW"]
f2cb = breaker [label: "CB-373", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-719", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-339", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-873", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1161", rating: "13 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
