require "json"
require "./spec_helper"

describe GraphQLClient do

	api = GraphQLClient.new "https://countries.trevorblades.com"

	describe "Queries" do
		it "return data from GQL API" do
			query = api.query("
				{
					continents {
						code
						name
					}
				}
			")

			query["data"].size.should be > 0
		end

		it "returns newQuery" do
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

			query["data"].size.should be > 0
		end
	end
end