sld "GEN-0648 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-401", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1610", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
busB = bus [label: "BUS-444", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbB1 = breaker [label: "CB-358", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-702", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
tie = ats [label: "CB-312", rating: "630 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1451", rating: "COMMON AREA LIGHTING / 30 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-745", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1407", rating: "RISER PANEL / 44 kW"]
f3cb = breaker [label: "CB-343", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-368", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1132", rating: "13 kW / EF"]

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
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
