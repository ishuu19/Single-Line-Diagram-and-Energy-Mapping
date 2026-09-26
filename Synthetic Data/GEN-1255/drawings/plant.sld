sld "GEN-1255 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-456", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1669", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-300", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-713", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "LIFE SAFETY BRANCH / 59 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
