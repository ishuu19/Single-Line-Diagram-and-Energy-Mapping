sld "GEN-0921 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-423", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "360 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-784", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1419", rating: "YARD LIGHTING / 27 kW"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1499", rating: "REEFER RACK PANEL / 134 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
