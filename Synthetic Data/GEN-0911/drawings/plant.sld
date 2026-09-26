sld "GEN-0911 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-456", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1607", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-336", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1425", rating: "CRITICAL BRANCH / 70 kW"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-759", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-304", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-852", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1128", rating: "27 kW / AHU"]

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
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
