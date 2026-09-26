sld "GEN-1142 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-428", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1623", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-379", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1cb = breaker [label: "CB-313", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1403", rating: "DOCK LIGHTING / 15 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
