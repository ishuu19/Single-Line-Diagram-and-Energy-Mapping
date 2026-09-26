sld "GEN-1268 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-469", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1618", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-797", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "620 kW"]
mcbA2 = breaker [label: "CB-324", rating: "MCCB / 1000 A / 3P"]
mctA2 = ct [label: "TA-791", rating: "3 CTs / 1000/5 A"]
mpmA2 = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-380", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1153", rating: "22 kW / COMP"]
f2cb = breaker [label: "CB-373", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1470", rating: "PACKAGING PANEL / 18 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
