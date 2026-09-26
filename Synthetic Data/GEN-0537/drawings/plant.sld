sld "GEN-0537 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1605", rating: "1390 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-741", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-778", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-319", rating: "MCCB / 160 A / 3P"]
f1l1m = motor [label: "MTR-1120", rating: "79 kW / BLOW"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-339", rating: "MCCB / 250 A / 3P"]
f2l1m = motor [label: "MTR-1142", rating: "103 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
