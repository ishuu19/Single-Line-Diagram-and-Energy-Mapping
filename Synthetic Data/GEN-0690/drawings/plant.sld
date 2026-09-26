sld "GEN-0690 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-415", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1667", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-392", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "250 kW"]
mcbA2 = breaker [label: "CB-311", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-702", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-374", rating: "MCCB / 20 A / 3P"]
f1l1drv = vfd [label: "DRV-814", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1102", rating: "8 kW / CRAC"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1450", rating: "RECTIFIER PDU / 20 kW"]

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
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
