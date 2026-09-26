sld "GEN-0474 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-446", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1670", rating: "1390 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-366", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
busB = bus [label: "BUS-406", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1697", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-319", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-786", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
tie = bus_tie [label: "CB-339", rating: "400 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-724", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1468", rating: "AUXILIARY PANEL / 117 kW"]
f2cb = breaker [label: "CB-389", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1496", rating: "AUXILIARY PANEL / 216 kW"]
f3cb = breaker [label: "CB-376", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-771", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1407", rating: "MCC AUXILIARY BOARD / 81 kW"]

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
