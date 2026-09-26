sld "GEN-1407 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-493", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1625", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-774", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
busB = bus [label: "BUS-472", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1676", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-319", rating: "MCCB / 1000 A / 3P"]
mctB1 = ct [label: "TA-759", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
tie = bus_tie [label: "CB-304", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-369", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1189", rating: "27 kW / COMP"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-741", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "SHOP AUXILIARIES / 46 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
