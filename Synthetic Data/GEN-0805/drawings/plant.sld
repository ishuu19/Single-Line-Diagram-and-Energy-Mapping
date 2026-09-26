sld "GEN-0805 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-439", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1617", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-323", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
busB = bus [label: "BUS-429", voltage: "400Y/230V"]
srcB1 = utility [label: "22kV SUPPLY B", voltage: "22kV"]
txB1 = transformer_yd [label: "TX-1619", rating: "1390 kVA", voltage: "22kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-397", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-728", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
tie = bus_tie [label: "CB-320", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-792", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1492", rating: "AUXILIARY PANEL / 22 kW"]
f2cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1467", rating: "AUXILIARY PANEL / 20 kW"]
f3cb = breaker [label: "CB-313", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-767", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1440", rating: "ACADEMIC BLOCK PANEL / 90 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
