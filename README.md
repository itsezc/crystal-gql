# GraphQL Client for Crystal
A GraphQL client shard for the Crystal language.

- Version: 0.1.3
- Crystal Version: 0.35.1

## Usage

**Initializing**

```ruby
require "crystal-gql"

# Define the client
api = GraphQLClient.new "https://countries.trevorblades.com"
```

**Querying**

```ruby
# useQuery
data, error, loading = api.useQuery(GQL {
	"continents" => [
		"code",
		"name",
		{
			"countries" => [
				"name",
				"capital",
				{
					"languages" => [
						"name"
					]
				}
			]
		}
	]
})

# or traditional queries
data, error, loading = api.query("{
    continents {
        code
        name
    	countries {
      		name
      		capital
      		languages {
        			name
      		}
    	}
    }
}")

# Print data
print data
```