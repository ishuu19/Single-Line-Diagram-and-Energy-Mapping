sld "GEN-0897 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1685", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-354", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-337", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-807", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1133", rating: "39 kW / PROC"]
f2cb = breaker [label: "CB-312", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-379", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1198", rating: "15 kW / EF"]
f3cb = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-778", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-343", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1108", rating: "11 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
