sld "GEN-0398 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-443", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-352", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-312", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1149", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-393", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1137", rating: "13 kW / EF"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3pnl = hub [label: "FD-952", rating: "3P+N"]
f3l1ld = load [label: "PNL-1477", rating: "SHORE POWER PANEL / 62 kW"]
f3l2ld = load [label: "PNL-1400", rating: "SHORE POWER PANEL / 51 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
