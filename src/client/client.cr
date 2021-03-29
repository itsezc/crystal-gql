require "json"
require "http/client"

class GQL(K, V) < Hash(String, V)
end

class GraphQLClient 
	def initialize(endpoint : String)
		protected @endpoint = endpoint
		@loading = false
	end

	def request(data)
		@loading = true

		headers = HTTP::Headers {
			"accept" => "application/json",
			"content-type" => "application/json"
		}

		response = JSON.parse(
			HTTP::Client
				.post(
					@endpoint, 
					headers: headers,
					body: data
				)
				.body
			)

		@loading = false

		data = response["data"]
		error = response.dig?("error")
		loading = @loading

		{
			data,
			error,
			loading
		}
	end

	def query(query : String, variables = {} of Symbol => String)
		requestQuery = JSON.build do | json |
			json.object do
				json.field "query", query
				json.field "variables", variables
			end
		end
		request(requestQuery)
	end

	def useQuery(hash : GQL, variables = {} of Symbol => String)
		query = %{
			{
				#{hash.first_key} {
					#{
						hash.first_value
							.join("\n")
							.gsub("{", "")
							.gsub("}", "")
							.gsub("=>", "")
							.gsub("[", "{")
							.gsub("]", "}")
							.gsub("\"", "")
							.gsub(",",  "\n")
					}
				}
			}
		}

		requestQuery = JSON.build do | json |
			json.object do 
				json.field "query", query
				json.field "variables", variables
			end
		end

		request(requestQuery)
	end
end