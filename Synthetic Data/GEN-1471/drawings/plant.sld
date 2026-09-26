sld "GEN-1471 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-485", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
busB = bus [label: "BUS-450", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1666", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-324", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-721", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
tie = bus_tie [label: "CB-342", rating: "2000 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-317", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1471", rating: "YARD LIGHTING / 17 kW"]
f2cb = breaker [label: "CB-393", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1407", rating: "REEFER RACK PANEL / 102 kW"]
f3cb = breaker [label: "CB-331", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-744", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1428", rating: "YARD LIGHTING / 17 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
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
