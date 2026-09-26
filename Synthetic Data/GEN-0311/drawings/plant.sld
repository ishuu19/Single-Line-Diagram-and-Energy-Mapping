sld "GEN-0311 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-414", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1603", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-315", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-700", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1045", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-318", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1174", rating: "24 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
