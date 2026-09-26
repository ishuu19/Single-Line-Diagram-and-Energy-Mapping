sld "GEN-1243 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-435", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1641", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-358", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "620 kW"]
mcbA2 = breaker [label: "CB-329", rating: "ACB / 1000 A / 3P"]
mctA2 = ct [label: "TA-783", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
srcA3 = solar [label: "PV ARRAY 267 kW", voltage: "400Y/230V"]
mcbA3 = breaker [label: "CB-374", rating: "MCCB / 800 A / 3P"]
mctA3 = ct [label: "TA-757", rating: "3 CTs / 800/5 A"]
mpmA3 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-728", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1416", rating: "CLASSROOM LIGHTING / 38 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-703", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-363", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1173", rating: "14 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
srcA3 -> mcbA3
mcbA3 -> mctA3
mctA3 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
mctA3 -> mpmA3
f1ct -> f1pm
f2ct -> f2pm
