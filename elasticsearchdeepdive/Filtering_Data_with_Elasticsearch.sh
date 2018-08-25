# search for "war" only from the play "King John"
curl -XGET "http://localhost:9200/shakespeare/_search?size=1000&pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": {
        "match": {
          "text_entry": "war"
        }
      },
      "filter": {
        "term": {
          "play_name": "King John"
        }
      }
    }
  }
}' > king_john_war.txt

# search for "peace" only from the play "King John"
curl -XGET "http://localhost:9200/shakespeare/_search?size=1000&pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": {
        "match": {
          "text_entry": "peace"
        }
      },
      "filter": {
        "term": {
          "play_name": "King John"
        }
      }
    }
  }
}' > king_john_peace.txt

# search for "love" only from the play "Romeo and Juliet"
curl -XGET "http://localhost:9200/shakespeare/_search?size=1000&pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": {
        "match": {
          "text_entry": "love"
        }
      },
      "filter": {
        "term": {
          "play_name": "Romeo and Juliet"
        }
      }
    }
  }
}' > romeo_and_juliet_love.txt

# search for "hate" only from the play "Romeo and Juliet"
curl -XGET "http://localhost:9200/shakespeare/_search?size=1000&pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": {
        "match": {
          "text_entry": "hate"
        }
      },
      "filter": {
        "term": {
          "play_name": "Romeo and Juliet"
        }
      }
    }
  }
}' > romeo_and_juliet_hate.txt