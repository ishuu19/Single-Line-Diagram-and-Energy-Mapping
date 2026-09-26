sld "GEN-1533 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-480", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-373", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
busB = bus [label: "BUS-470", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
mcbB1 = breaker [label: "CB-388", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-766", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
tie = bus_tie [label: "CB-311", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-391", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1124", rating: "7 kW / EF"]
f2cb = breaker [label: "CB-379", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-358", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1137", rating: "19 kW / COMP"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
