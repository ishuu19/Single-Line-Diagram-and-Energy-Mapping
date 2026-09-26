sld "PLANT-04 — PRIMARY SUBSTATION / 138 kV - 13.8 kV"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-497", voltage: "13.8kV"]
srcA1 = utility [label: "138 kV GRID", voltage: "138kV"]
laA1 = surge_arrester [label: "LA-1292", voltage: "138kV"]
txA1 = transformer_dy [label: "TX-1614", rating: "15000 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-384", rating: "SF6 CB / 1200 A / 3P"]
mctA1 = ct [label: "TA-738", rating: "3 CTs / 1200/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 600 A / 3P"]
f1ct = ct [label: "TA-755", rating: "3 CTs / 600/5 A"]
f1pm = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1pr = recloser [label: "CB-361", rating: "600 A"]
f1l1ld = load [label: "PNL-1466", rating: "FEEDER 1 / INDUSTRIAL PARK / 2400 kW"]
f2cb = breaker [label: "CB-383", rating: "MCCB / 600 A / 3P"]
f2ct = ct [label: "TA-765", rating: "3 CTs / 600/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2pr = recloser [label: "CB-310", rating: "600 A"]
f2l1ld = load [label: "PNL-1431", rating: "FEEDER 2 / TOWN NORTH / 1850 kW"]
f3cb = breaker [label: "CB-396", rating: "MCCB / 600 A / 3P"]
f3ct = ct [label: "TA-740", rating: "3 CTs / 600/5 A"]
f3pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f3pr = sectionalizer [label: "CB-358", rating: "600 A"]
f3l1ld = load [label: "PNL-1464", rating: "FEEDER 3 / TOWN SOUTH / 1320 kW"]
f4cb = breaker [label: "CB-399", rating: "MCCB / 200 A / 3P"]
f4ct = ct [label: "TA-743", rating: "3 CTs / 200/5 A"]
f4pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f4pr = fuse [label: "CB-337", rating: "200 A"]
f4l1ld = load [label: "PNL-1432", rating: "STATION SERVICE / 280 kW"]

srcA1 -> laA1
srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#350 MCM"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1l1ld
busA -> f2cb [cable: "3#350 MCM"]
f2cb -> f2ct
f2ct -> f2pr
f2pr -> f2l1ld
busA -> f3cb [cable: "3#350 MCM"]
f3cb -> f3ct
f3ct -> f3pr
f3pr -> f3l1ld
busA -> f4cb [cable: "3#1/0 AWG"]
f4cb -> f4ct
f4ct -> f4pr
f4pr -> f4l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
f4ct -> f4pm
