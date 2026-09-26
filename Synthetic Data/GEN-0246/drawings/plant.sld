sld "GEN-0246 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-470", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1689", rating: "1110 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-301", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1000 kW"]
mcbA2 = breaker [label: "CB-326", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-725", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-737", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-369", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-886", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1195", rating: "27 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
