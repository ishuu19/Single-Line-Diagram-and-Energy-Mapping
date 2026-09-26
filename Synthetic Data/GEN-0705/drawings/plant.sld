sld "GEN-0705 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1636", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-330", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-720", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "1000 kW"]
mcbA2 = breaker [label: "CB-345", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-769", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-377", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1183", rating: "14 kW / EF"]
f2cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-766", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-375", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-838", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1112", rating: "32 kW / CRAC"]

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
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
