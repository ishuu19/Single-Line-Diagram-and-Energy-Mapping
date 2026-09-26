sld "GEN-0718 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-442", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-342", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1cb = breaker [label: "CB-303", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-339", rating: "MCCB / 40 A / 3P"]
f1l1m = motor [label: "MTR-1139", rating: "21 kW / COMP"]
f2cb = breaker [label: "CB-388", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-772", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-319", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1196", rating: "20 kW / COND"]

srcA1 -> mcbA1
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
