sld "GEN-0416 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1655", rating: "170 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-380", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
busB = bus [label: "BUS-470", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1687", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-350", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-744", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1020", rating: "kW / kWh"]
tie = bus_tie [label: "CB-313", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-363", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-717", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1463", rating: "RECTIFIER PDU / 31 kW"]
f2cb = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-750", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1403", rating: "SHELTER LIGHTING / 5 kW"]
f3cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-790", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1453", rating: "SHELTER LIGHTING / 12 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
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
