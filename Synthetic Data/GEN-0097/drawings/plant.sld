sld "GEN-0097 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-482", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-330", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1452", rating: "YARD LIGHTING / 32 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1447", rating: "YARD LIGHTING / 20 kW"]

srcA1 -> mcbA1
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
