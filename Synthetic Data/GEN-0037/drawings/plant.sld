sld "GEN-0037 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-491", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1615", rating: "90 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1444", rating: "DOCK PANEL / 33 kW"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1423", rating: "DOCK PANEL / 26 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
