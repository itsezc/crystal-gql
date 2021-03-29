# GraphQL Client for Crystal

A GraphQL client shard for the Crystal language.

- Version: 0.1.3
- Crystal Version: 0.35.1

## Usage

**Installing**

Just add this to your shards.yml file:

```yml
dependencies:

  crystal-gql:
    github: itsezc/crystal-gql

```

Then run:

```bash
shards install
```

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

**Querying**

With authentication:


```ruby
api.add_header("Authorization", "Bearer: TOKEN")
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
```
