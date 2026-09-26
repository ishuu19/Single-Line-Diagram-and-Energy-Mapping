sld "GEN-1457 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-477", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1684", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-305", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1029", rating: "kW / kWh"]
f1cb = breaker [label: "CB-345", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1pnl = hub [label: "FD-924", rating: "3P+N"]
f1l1cb = breaker [label: "CB-367", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-873", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1158", rating: "36 kW / BLOW"]
f1l2cb = breaker [label: "CB-343", rating: "MCCB / 200 A / 3P"]
f1l2drv = vfd [label: "DRV-802", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1140", rating: "44 kW / RWP"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-712", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1452", rating: "DOSING PANEL / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
