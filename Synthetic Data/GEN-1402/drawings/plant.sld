sld "GEN-1402 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-484", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1659", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-392", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-393", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-345", rating: "MCCB / 100 A / 3P"]
f1l1m = motor [label: "MTR-1166", rating: "44 kW / COMP"]
f2cb = breaker [label: "CB-369", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-816", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1177", rating: "43 kW / PROC"]
f3cb = breaker [label: "CB-302", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-759", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-301", rating: "MCCB / 80 A / 3P"]
f3l1m = motor [label: "MTR-1171", rating: "35 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
