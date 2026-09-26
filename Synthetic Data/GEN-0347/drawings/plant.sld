sld "GEN-0347 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1604", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-303", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-743", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1462", rating: "TENANT PANEL / 98 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
