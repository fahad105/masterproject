#!/bin/bash
set -x

echo "----------------- INSERT QUERY ---" >> /etc/network/cliopatrialog.txt

#INSERT QUERY
/usr/bin/curl 192.168.77.1:8910/demo/sparql/?query=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rm%3A+%3Chttp%3A%2F%2Fpurl.org%2Fcollections%2Fw4ra%2Fradiomarche%2F%3E%0D%0A%0D%0AINSERT+DATA+%7B%0D%0A++++rm%3Aproduct-Beurre_de_karite+rdfs%3Alabel+%22Shea+butter%22%40en+.%0D%0A++++rm%3Aproduct-Beurre_de_karite+rdfs%3Alabel+%22La+manteca+de+karit%C3%A9%22%40es+.%0D%0A++++rm%3Aproduct-Miel_liquide+rdfs%3Alabel+%22Honey%22%40en+.%0D%0A++++rm%3Aproduct-Miel_liquide+rdfs%3Alabel+%22Miel%22%40es+.%0D%0A++++rm%3Aproduct-Amande_de_karite+rdfs%3Alabel+%22Shea+nuts%22%40en+.%0D%0A++++rm%3Aproduct-Amande_de_karite+rdfs%3Alabel+%22Nueces+de+karit%C3%A9%22%40es+.%0D%0A++++rm%3Aproduct-Tamarin+rdfs%3Alabel+%22Tamarind%22%40en+.%0D%0A++++rm%3Aproduct-Tamarin+rdfs%3Alabel+%22Tamarindo%22%40es+.%0D%0A++++rm%3Aproduct-Graine_de_nere+rdfs%3Alabel+%22Nere+seeds%22%40en+.%0D%0A++++rm%3Aproduct-Graine_de_nere+rdfs%3Alabel+%22Semillas+Nere%22%40es+.+%7D  >> /etc/network/cliopatrialog.txt

echo "----------------- CONSTRUCT QUERY ---" >> /etc/network/cliopatrialog.txt
#CONSTRUCT QUERY
/usr/bin/curl 192.168.77.1:8910/demo/sparql/?query=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rm%3A+%3Chttp%3A%2F%2Fpurl.org%2Fcollections%2Fw4ra%2Fradiomarche%2F%3E%0D%0A%0D%0ACONSTRUCT+%7B%0D%0A++++%3Fcontact+rm%3Acontact_tel+%3Ftel+.%0D%0A++++%3Fcontact+rm%3Ahas_offering+%3Foffering+.%0D%0A++++%3Foffering+rdfs%3Alabel+%3Fprod_name%0D%0A%7D+WHERE+%7B%0D%0A++++%3Foffering+a+rm%3AOffering+.%0D%0A++++%3Foffering+rm%3Ahas_contact+%3Fcontact+.%0D%0A++++%3Foffering+rm%3Aprod_name+%3Fprod+.%0D%0A++++%3Fprod+rdfs%3Alabel+%3Fprod_name+.%0D%0A++++%3Fcontact+rm%3Acontact_tel+%3Ftel+.%0D%0A++++%3Fcontact+rm%3Azone+%3Fzone+.%0D%0A++++FILTER+%28%3Fzone+IN+%28rm%3Azone_Mafoune%2C+rm%3Azone_Mandiakuy%29%29+%7D >> /etc/network/cliopatrialog.txt


