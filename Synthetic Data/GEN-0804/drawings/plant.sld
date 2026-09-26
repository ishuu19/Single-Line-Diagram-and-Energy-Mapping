sld "GEN-0804 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-450", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1657", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
busB = bus [label: "BUS-412", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1618", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-328", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-714", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
tie = bus_tie [label: "CB-362", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1499", rating: "DOCK LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-799", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1457", rating: "SHORE POWER PANEL / 73 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
