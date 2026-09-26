sld "GEN-0373 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-468", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1600", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-362", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-769", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
busB = bus [label: "BUS-404", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1695", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-318", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-797", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
tie = bus_tie [label: "CB-360", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-720", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1468", rating: "LIFE SAFETY BRANCH / 38 kW"]
f2cb = breaker [label: "CB-310", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-762", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1486", rating: "LIFE SAFETY BRANCH / 31 kW"]
f3cb = breaker [label: "CB-392", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-749", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1412", rating: "WARD LIGHTING / 32 kW"]

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
