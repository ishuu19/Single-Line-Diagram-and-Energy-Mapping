sld "GEN-0932 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-313", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-797", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f1l1drv = vfd [label: "DRV-838", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1165", rating: "29 kW / BLOW"]
f2cb = breaker [label: "CB-379", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-751", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1443", rating: "DOSING PANEL / 21 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
