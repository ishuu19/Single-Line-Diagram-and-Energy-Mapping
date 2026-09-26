sld "GEN-0580 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-469", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1601", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-388", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1cb = breaker [label: "CB-380", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1427", rating: "MCC AUXILIARY BOARD / 74 kW"]
f2cb = breaker [label: "CB-378", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-743", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2pnl = hub [label: "FD-907", rating: "3P+N"]
f2l1cb = breaker [label: "CB-304", rating: "MCCB / 320 A / 3P"]
f2l1m = motor [label: "MTR-1162", rating: "171 kW / BLOW"]
f2l2cb = breaker [label: "CB-356", rating: "MCCB / 800 A / 3P"]
f2l2drv = vfd [label: "DRV-864", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1166", rating: "433 kW / MILL"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
