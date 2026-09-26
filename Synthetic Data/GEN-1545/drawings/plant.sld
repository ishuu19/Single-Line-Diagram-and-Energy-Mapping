sld "GEN-1545 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-407", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1252", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1603", rating: "23900 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1cb = breaker [label: "CB-374", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-756", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1456", rating: "STATION SERVICE / 61 kW"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1490", rating: "DISTRIBUTION FEEDER / 1115 kW"]
f3cb = breaker [label: "CB-367", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-765", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f3pr = recloser [label: "CB-318", rating: "400 A"]
f3l1ld = load [label: "PNL-1494", rating: "STATION SERVICE / 73 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3pr
f3pr -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
