sld "GEN-1451 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-447", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1682", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-704", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
busB = bus [label: "BUS-426", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbB1 = breaker [label: "CB-395", rating: "ACB / 2000 A / 3P"]
mctB1 = ct [label: "TA-710", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
tie = ats [label: "CB-376", rating: "400 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-324", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1163", rating: "18 kW / EF"]
f2cb = breaker [label: "CB-348", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-737", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1491", rating: "FLOOR LIGHTING / 70 kW"]

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
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
