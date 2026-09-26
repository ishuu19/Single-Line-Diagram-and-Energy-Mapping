sld "GEN-0723 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1668", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-377", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-317", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-397", rating: "MCCB / 200 A / 3P"]
f1l1drv = vfd [label: "DRV-821", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1187", rating: "84 kW / COMP"]
f2cb = breaker [label: "CB-385", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-395", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1197", rating: "5 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
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
