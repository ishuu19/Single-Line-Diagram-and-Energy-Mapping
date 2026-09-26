sld "GEN-0498 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-491", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1651", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-312", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-715", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_yd [label: "TX-1606", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-369", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-754", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-749", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-393", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1177", rating: "54 kW / COMP"]
f1x = capacitor_bank [label: "CAP-612", rating: "180 kVAR"]
f2cb = breaker [label: "CB-321", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1474", rating: "SHOP LIGHTING / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
f1ct -> f1x
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
