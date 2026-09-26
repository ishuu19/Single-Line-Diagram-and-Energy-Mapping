sld "GEN-0826 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-489", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-754", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
busB = bus [label: "BUS-488", voltage: "400Y/230V"]
srcB1 = utility [label: "6.6kV SUPPLY B", voltage: "6.6kV"]
txB1 = transformer_dy [label: "TX-1638", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-379", rating: "MCCB / 400 A / 3P"]
mctB1 = ct [label: "TA-726", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
tie = bus_tie [label: "CB-342", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-312", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1492", rating: "AUXILIARY PANEL / 5 kW"]
f2cb = breaker [label: "CB-352", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1418", rating: "REEFER RACK PANEL / 132 kW"]
f3cb = breaker [label: "CB-374", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-746", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1454", rating: "REEFER RACK PANEL / 146 kW"]

srcA1 -> mcbA1
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
busB -> f2cb [cable: "3#1/0 AWG"]
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
