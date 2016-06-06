find ./data/json/archive-carpark -name "*.json"  -exec cat {} ";" | logstash -f src/logstash/logstash-stdin-carpark.conf
