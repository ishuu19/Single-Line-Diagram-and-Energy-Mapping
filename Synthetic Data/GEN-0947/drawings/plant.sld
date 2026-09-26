sld "GEN-0947 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-331", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_yd [label: "TX-1686", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-306", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-742", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-324", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
f1pnl = hub [label: "FD-968", rating: "3P+N"]
f1l1cb = breaker [label: "CB-332", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-812", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1113", rating: "35 kW / RWP"]
f1l2cb = breaker [label: "CB-308", rating: "MCCB / 40 A / 3P"]
f1l2drv = vfd [label: "DRV-831", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1115", rating: "17 kW / BLOW"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-758", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1407", rating: "DOSING PANEL / 40 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
