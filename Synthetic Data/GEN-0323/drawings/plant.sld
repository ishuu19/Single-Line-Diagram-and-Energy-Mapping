sld "GEN-0323 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-408", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1615", rating: "1390 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-344", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-786", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1250 kW"]
mcbA2 = breaker [label: "CB-312", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-784", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1443", rating: "PACKAGING PANEL / 29 kW"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-740", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-369", rating: "MCCB / 100 A / 3P"]
f2l1m = motor [label: "MTR-1111", rating: "44 kW / COMP"]
f2x = capacitor_bank [label: "CAP-679", rating: "83 kVAR"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
f2ct -> f2x
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
