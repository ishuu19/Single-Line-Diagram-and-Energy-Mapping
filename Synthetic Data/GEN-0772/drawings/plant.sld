sld "GEN-0772 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1669", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-341", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-751", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f1cb = breaker [label: "CB-361", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1440", rating: "DOCK LIGHTING / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
