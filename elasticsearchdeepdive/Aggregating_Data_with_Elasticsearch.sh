# number of docs per response code
curl -XGET "http://localhost:9200/logs/_search?size=0&pretty" -H 'Content-Type: application/json' -d'
{
  "aggs": {
    "status": {
      "terms": {
        "field": "response.keyword",
        "size": 10
      }
    }
  }
}' > responses.txt

# number of unique clients
curl -XGET "http://localhost:9200/logs/_search?size=0&pretty" -H 'Content-Type: application/json' -d'
{
  "aggs": {
    "unique_clients": {
      "cardinality": {
        "field": "clientip.keyword"
      }
    }
  }
}' > clients.txt

# bandwidth by file extension
curl -XGET "http://localhost:9200/logs/_search?size=0&pretty" -H 'Content-Type: application/json' -d'
{
  "size": 1,
  "aggs": {
    "method": {
      "terms": {
        "field": "extension.keyword",
        "size": 10,
        "order": {
          "sum_of_bytes": "desc"
        }
      },
      "aggs": {
        "sum_of_bytes": {
          "sum": {
            "field": "bytes"
          }
        }
      }
    }
  }
}' > bandwidth.txt