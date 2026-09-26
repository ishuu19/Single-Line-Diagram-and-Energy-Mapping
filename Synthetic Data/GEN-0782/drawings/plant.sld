sld "GEN-0782 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1645", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-780", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
busB = bus [label: "BUS-488", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1669", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-332", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-726", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
tie = bus_tie [label: "CB-338", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-746", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1438", rating: "MCC AUXILIARY BOARD / 77 kW"]
f2cb = breaker [label: "CB-336", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1487", rating: "AUXILIARY PANEL / 466 kW"]
f3cb = breaker [label: "CB-385", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-776", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1435", rating: "AUXILIARY PANEL / 543 kW"]

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
busB -> f2cb [cable: "3#2/0 AWG"]
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
