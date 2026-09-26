sld "GEN-1260 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-415", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1660", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
busB = bus [label: "BUS-475", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_dy [label: "TX-1686", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-362", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
tie = bus_tie [label: "CB-305", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1402", rating: "AUXILIARY PANEL / 36 kW"]
f2cb = breaker [label: "CB-377", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1489", rating: "WARD LIGHTING / 35 kW"]
f3cb = breaker [label: "CB-354", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-741", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1462", rating: "LIFE SAFETY BRANCH / 32 kW"]

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
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
