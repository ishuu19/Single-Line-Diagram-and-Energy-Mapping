sld "GEN-0024 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
busB = bus [label: "BUS-430", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "620 kW"]
mcbB1 = breaker [label: "CB-372", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-732", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
tie = ats [label: "CB-358", rating: "400 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-715", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1413", rating: "DOCK LIGHTING / 11 kW"]
f2cb = breaker [label: "CB-373", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f2pnl = hub [label: "FD-991", rating: "3P+N"]
f2l1cb = breaker [label: "CB-315", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1109", rating: "14 kW / EF"]
f2l2ld = load [label: "PNL-1417", rating: "SHORE POWER PANEL / 64 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
