sld "GEN-1273 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-456", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1664", rating: "1730 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1422", rating: "MCC AUXILIARY BOARD / 75 kW"]
f2cb = breaker [label: "CB-380", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-301", rating: "MCCB / 250 A / 3P"]
f2l1m = motor [label: "MTR-1166", rating: "117 kW / BLOW"]
f3cb = breaker [label: "CB-329", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-709", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-381", rating: "MCCB / 1000 A / 3P"]
f3l1drv = vfd [label: "DRV-830", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1170", rating: "591 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
