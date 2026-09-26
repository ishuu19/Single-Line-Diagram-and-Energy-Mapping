sld "GEN-0797 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1656", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f1cb = breaker [label: "CB-314", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-794", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1442", rating: "MCC AUXILIARY BOARD / 78 kW"]
f1x = capacitor_bank [label: "CAP-677", rating: "68 kVAR"]
f2cb = breaker [label: "CB-360", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-735", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1496", rating: "MCC AUXILIARY BOARD / 77 kW"]
f2x = harmonic_filter [label: "HF-537", rating: "5th / 7th"]
f3cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-752", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f3pnl = hub [label: "FD-954", rating: "3P+N"]
f3l1cb = breaker [label: "CB-393", rating: "MCCB / 800 A / 3P"]
f3l1drv = vfd [label: "DRV-848", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1114", rating: "362 kW / MILL"]
f3l2ld = load [label: "PNL-1464", rating: "MCC AUXILIARY BOARD / 81 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
f1ct -> f1x
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
f2ct -> f2x
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
f3pnl -> f3l2ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
