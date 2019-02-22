#!/bin/bash
awk -F, '{if($7=='2012') iter [$1]+=$10} END{for (hasil in iter) print iter[hasil], hasil}' Downloads/WA_Sales_Products_2012-14.csv OFS=','| sort -nr | head -n1 | awk -F, '{print $2}'
awk -F, '{if($7 == '2012' && $1=="United States") iter[$4]+=$10} END {for(hasil in iter) {print iter[hasil], hasil}}' Downloads/WA_Sales_Products_2012-14.csv OFS=',' | sort -nr | head -n3 | awk -F, '{print $2}'
awk -F, '{if(($7 == '2012' && $1=="United States")  && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) iter[$6]+=$10} END {for(hasil in iter) {print iter[hasil], hasil}}' Downloads/WA_Sales_Products_2012-14.csv OFS=',' | sort -nr | head -n3 | awk -F, '{print $2}'
