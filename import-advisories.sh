find ./data/json/archive-advisory -name "*.json"  -exec cat {} ";" | logstash -f src/logstash/logstash-stdin-advisory.conf
