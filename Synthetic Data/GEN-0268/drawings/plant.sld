sld "GEN-0268 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1688", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-314", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-739", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-340", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1150", rating: "10 kW / EF"]
f2cb = breaker [label: "CB-330", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f2l1m = motor [label: "MTR-1155", rating: "13 kW / EF"]
f3cb = breaker [label: "CB-392", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-768", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f3pnl = hub [label: "FD-971", rating: "3P+N"]
f3l1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f3l1m = motor [label: "MTR-1133", rating: "15 kW / EF"]
f3l2cb = breaker [label: "CB-371", rating: "MCCB / 50 A / 3P"]
f3l2m = motor [label: "MTR-1178", rating: "11 kW / EF"]

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
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1cb
f3l1cb -> f3l1m
f3pnl -> f3l2cb
f3l2cb -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
