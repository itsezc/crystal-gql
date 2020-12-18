require "json"
require "./spec_helper"

describe GraphQLClient do

	api = GraphQLClient.new "https://countries.trevorblades.com"

	describe "Queries" do
		it "return data from GQL API" do
			data, error, loading = api.query("
				{
					continents {
						code
						name
					}
				}
			")

			data.size.should be > 0
		end

		it "returns newQuery" do
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

			data.size.should be > 0
		end
	end
end