sld "GEN-0546 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-452", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1663", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-343", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1172", rating: "19 kW / COMP"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-391", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1139", rating: "21 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
