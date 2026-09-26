sld "GEN-1229 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1602", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-719", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
busB = bus [label: "BUS-463", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1693", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-374", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-799", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
tie = bus_tie [label: "CB-388", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1493", rating: "REEFER RACK PANEL / 129 kW"]
f2cb = breaker [label: "CB-383", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-734", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1404", rating: "YARD LIGHTING / 21 kW"]
f3cb = breaker [label: "CB-309", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-731", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1421", rating: "AUXILIARY PANEL / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
