require "json"
require "http/client"

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
					body:  data
				)
				.body
			)
		@loading = false
		return response
	end

	def query(query : String)
		requestQuery = JSON.build do | json |
			json.object do
				json.field "query", query
			end
		end

		response = request(requestQuery)
		print(response)
		return response
	end
end