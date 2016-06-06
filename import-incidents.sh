find ./data/json/archive-incident -name "*.json"  -exec cat {} ";" | logstash -f src/logstash/logstash-stdin-incident.conf
