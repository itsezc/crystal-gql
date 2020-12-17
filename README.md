# GraphQL Client for Crystal
A GraphQL client shard for the Crystal language.


- Version: 0.1.2
- Crystal Version: 0.35.1


## Usage

**Initializing**

```ruby
require "crystal-gql"

# Define the client
api = GraphQLClient.new "https://countries.trevorblades.com"
```

**Querying**

![Query examples](https://i.imgur.com/GszWisp.png)

```
# Print data
print query["data"]
```