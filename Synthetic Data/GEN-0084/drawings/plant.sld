sld "GEN-0084 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-469", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1670", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-777", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-312", rating: "MCCB / 160 A / 3P"]
f1l1drv = vfd [label: "DRV-833", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1145", rating: "68 kW / RWP"]
f2cb = breaker [label: "CB-374", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-327", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-847", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1172", rating: "15 kW / BLOW"]
f3cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-356", rating: "MCCB / 100 A / 3P"]
f3l1drv = vfd [label: "DRV-871", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1168", rating: "41 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
