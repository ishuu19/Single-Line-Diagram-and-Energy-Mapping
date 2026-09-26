sld "GEN-0907 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-471", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
mcbA1 = breaker [label: "CB-352", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-742", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1607", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-337", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-712", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1484", rating: "REEFER RACK PANEL / 148 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
