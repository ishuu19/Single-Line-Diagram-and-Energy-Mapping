sld "GEN-0599 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-406", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1601", rating: "230 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-734", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 159 kW", voltage: "208Y/120V"]
mcbA2 = breaker [label: "CB-384", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-719", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-383", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1116", rating: "33 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
