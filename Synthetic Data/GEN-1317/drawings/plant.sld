sld "GEN-1317 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-403", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1680", rating: "2080 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-331", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1497", rating: "MCC AUXILIARY BOARD / 42 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-749", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-319", rating: "MCCB / 500 A / 3P"]
f2l1m = motor [label: "MTR-1132", rating: "200 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
