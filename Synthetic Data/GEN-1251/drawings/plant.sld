sld "GEN-1251 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1671", rating: "1730 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-396", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-376", rating: "MCCB / 630 A / 3P"]
f1l1drv = vfd [label: "DRV-867", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1141", rating: "250 kW / MILL"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-748", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1465", rating: "MCC AUXILIARY BOARD / 52 kW"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1468", rating: "MCC AUXILIARY BOARD / 87 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
