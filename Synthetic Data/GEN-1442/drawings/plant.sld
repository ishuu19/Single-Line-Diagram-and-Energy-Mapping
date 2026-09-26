sld "GEN-1442 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-465", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1667", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1487", rating: "ACADEMIC BLOCK PANEL / 76 kW"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-762", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-391", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-841", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1187", rating: "20 kW / AHU"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-757", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1433", rating: "SITE LIGHTING / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
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
