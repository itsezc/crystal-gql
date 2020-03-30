require "./crystal-gql/client"

# test = GraphQLClient.new "https://countries.trevorblades.com"

# query1 = test.query("
# 	{
# 		continents {
# 			code
# 			name
# 		}
# 	}
# ")

# query2 = test.query(
# 	"
# 		query findContinent($code: ID!) {
# 			continent(code: $code) {
# 				code
# 				name
# 			}
# 	    }
# 	", {
# 		"code" => "AF"
# 	}
# )