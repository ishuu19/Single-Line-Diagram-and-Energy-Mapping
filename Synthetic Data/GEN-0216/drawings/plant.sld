sld "GEN-0216 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1615", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-350", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-711", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
busB = bus [label: "BUS-465", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1631", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-324", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
tie = bus_tie [label: "CB-353", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "SHORE POWER PANEL / 55 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1485", rating: "DOCK LIGHTING / 18 kW"]
f3cb = breaker [label: "CB-378", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-754", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1453", rating: "DOCK LIGHTING / 17 kW"]

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
busB -> f2cb [cable: "3#4 AWG"]
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
