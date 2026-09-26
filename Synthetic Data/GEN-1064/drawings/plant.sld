sld "GEN-1064 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-402", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1610", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-337", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-732", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-734", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1431", rating: "DOCK LIGHTING / 12 kW"]
f2cb = breaker [label: "CB-394", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-792", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1441", rating: "DOCK LIGHTING / 13 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
