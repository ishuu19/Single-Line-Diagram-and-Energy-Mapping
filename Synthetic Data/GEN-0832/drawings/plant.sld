sld "GEN-0832 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-492", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1699", rating: "1110 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-393", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-349", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1479", rating: "MCC AUXILIARY BOARD / 59 kW"]
f2cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-309", rating: "MCCB / 320 A / 3P"]
f2l1m = motor [label: "MTR-1155", rating: "139 kW / BLOW"]
f3cb = breaker [label: "CB-319", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-756", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-378", rating: "MCCB / 1000 A / 3P"]
f3l1drv = vfd [label: "DRV-885", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1151", rating: "437 kW / MILL"]

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
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
