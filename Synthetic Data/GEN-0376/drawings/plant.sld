sld "GEN-0376 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-464", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-342", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-781", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
busB = bus [label: "BUS-469", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_yd [label: "TX-1630", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-356", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-777", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
tie = bus_tie [label: "CB-315", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1491", rating: "AUXILIARY PANEL / 35 kW"]
f2cb = breaker [label: "CB-399", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1496", rating: "AUXILIARY PANEL / 47 kW"]
f3cb = breaker [label: "CB-375", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-701", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1493", rating: "DOCK PANEL / 23 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
