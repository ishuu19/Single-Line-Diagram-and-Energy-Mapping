sld "GEN-0681 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-440", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1641", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-374", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-795", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1644", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-363", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1cb = breaker [label: "CB-319", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1460", rating: "WARD LIGHTING / 44 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
