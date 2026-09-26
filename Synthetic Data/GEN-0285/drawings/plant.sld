sld "GEN-0285 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1645", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-717", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
busB = bus [label: "BUS-497", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1657", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-343", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-743", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
tie = bus_tie [label: "CB-379", rating: "1000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1484", rating: "DOSING PANEL / 36 kW"]
f2cb = breaker [label: "CB-347", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-754", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1400", rating: "AUXILIARY PANEL / 40 kW"]
f3cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-723", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1434", rating: "DOSING PANEL / 39 kW"]

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
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
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
