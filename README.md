# Singapore LTA Demo

## Overview

This is a demo to visualize some Singapore LTA public datasets using the Elastic stack:

- Elasticsearch
- Kibana
- Logstash

[Singapore Land Transport Authority](http://lta.gov.sg) provides [public APIs](http://www.mytransport.sg/content/mytransport/home/dataMall.html) to access to real time information like carparks, incidents and advisories among others. This demo covers approximately 40 days of information collected between October and September 2015 and contains 3 indices:

- singapore-lta-carpark: 686K events sampled every 2 minutes 
- singapore-lta-advisory: 221K events sampled every 5 minutes
- singapore-lta-incidents: 295K events sampled every 5 minutes

![incidents](https://raw.githubusercontent.com/mcascallares/singapore-lta-demo/master/screenshots/incidents.png "Incidents")
![advisories](https://raw.githubusercontent.com/mcascallares/singapore-lta-demo/master/screenshots/advisories.png "Advisories")

## Setup

### Requirements

- Elasticsearch 5.1.1 or higher
- Kibana 5.1.1 or higher
- Logstash 5.1.1 or higher

### Importing datasets using logstash

From the folder singapore-lta execute the following commands to import into localhost:9200 the provided datasets.

If you need to import into another host/port change the elasticsearch output configuration in src/logstash/logstash-stdin-< dataset_name >.conf

```
cd singapore-lta
unzip data/json.zip -d data
./import-advisories.sh
./import-carparks.sh
./import-incidents.sh
```

**NOTE: It is import to execute these commands from the singapore-lta foler due to relative paths in logstash template configuration.**


### Create Kibana index patterns

Go to Settings > Indices and define the following index patterns:

- ``singapore-lta-incident-*``
- ``singapore-lta-carpark-*``
- ``singapore-lta-advisory-*``


### Import dashboard objects into kibana

Go to Settings > Objects > Import and import the following files in the specified order:

- singapore-lta/src/kibana/visualizations.json
- singapore-lta/src/kibana/dashboards.json


## Legal

Source data provided by Singapore LTA.

More details in their [terms and conditions](http://www.mytransport.sg/content/mytransport/home/dataMall/termOfUse.html).
