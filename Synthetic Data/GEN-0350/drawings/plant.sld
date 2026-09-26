sld "GEN-0350 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-454", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1603", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-398", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 347 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-392", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-374", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1172", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-786", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-317", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-818", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1190", rating: "29 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
