sld "GEN-0895 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-472", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1607", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-301", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
busB = bus [label: "BUS-459", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_dy [label: "TX-1609", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-327", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-749", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
tie = bus_tie [label: "CB-395", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1465", rating: "AUXILIARY PANEL / 51 kW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-710", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1415", rating: "AUXILIARY PANEL / 54 kW"]
f3cb = breaker [label: "CB-377", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-743", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1416", rating: "AUXILIARY PANEL / 29 kW"]

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
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
