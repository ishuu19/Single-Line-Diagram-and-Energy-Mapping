sld "GEN-0809 — EV CHARGING HUB / ELECTRICAL DISTRIBUTION"
# CHARGING PLAZA SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1652", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
busB = bus [label: "BUS-463", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
mcbB1 = breaker [label: "CB-317", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-797", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
tie = bus_tie [label: "CB-366", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1458", rating: "FORECOURT LIGHTING / 16 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1445", rating: "DC FAST CHARGER BANK / 185 kW"]
f3cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-750", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1428", rating: "DC FAST CHARGER BANK / 117 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
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
