# output accounts with last name 'Fitzpatrick'
curl -XGET "http://localhost:9200/bank/account/_search?q=lastname:Fitzpatrick&pretty" > /tmp/fitzpatrick.txt

# verify
cat /tmp/fitzpatrick.txt

# output accounts for state of Texas
curl -XGET "http://localhost:9200/bank/account/_search?q=state:TX&size=30&pretty" > /tmp/texas.txt

# verify 
cat /tmp/texas.txt

# output accounts with employer Eclipto
curl -XGET "http://localhost:9200/bank/account/_search?q=employer:Eclipto&pretty" > /tmp/eclipto.txt

# verify
cat /tmp/eclipto.txt