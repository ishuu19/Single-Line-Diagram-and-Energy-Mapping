sld "GEN-0567 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-411", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1640", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-392", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-389", rating: "MCCB / 125 A / 3P"]
f1l1drv = vfd [label: "DRV-885", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1109", rating: "68 kW / PROC"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f2l1m = motor [label: "MTR-1187", rating: "54 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
