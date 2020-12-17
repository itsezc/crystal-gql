# GraphQL Client for Crystal
A GraphQL client shard for the Crystal language.


- Version: 0.1.2
- Crystal Version: 0.35.1


## Usage

Initializing
```ruby
require "crystal-gql"

# Define the client
api = GraphQLClient.new "https://countries.trevorblades.com"
```

Querying with useQuery

```ruby
# useQuery
query = api.useQuery({
	"continents" => [
		"code",
		"name",
		{
			"countries" => [
				"name",
				"capital"
			]
		}
	]
})

# Print data
print query["data"]
```

Querying with (traditional) query
```ruby
# Traditional Query
query = api.query("
	{
		continents {
			code
			name
			countries {
				name
				capital
			}
		}
	}
")

# Print data
print query["data"]
```