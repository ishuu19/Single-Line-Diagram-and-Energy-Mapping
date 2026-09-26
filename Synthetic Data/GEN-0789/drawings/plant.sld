sld "GEN-0789 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1686", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-395", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
busB = bus [label: "BUS-478", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1618", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-315", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-722", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
tie = bus_tie [label: "CB-309", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1pnl = hub [label: "FD-963", rating: "3P+N"]
f1l1ld = load [label: "PNL-1449", rating: "SALES FLOOR LIGHTING / 48 kW"]
f1l2cb = breaker [label: "CB-361", rating: "MCCB / 16 A / 3P"]
f1l2m = motor [label: "MTR-1105", rating: "6 kW / EF"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-304", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1177", rating: "13 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
