require "json"
require "./spec_helper"

describe GraphQLClient do

	test = GraphQLClient.new "https://countries.trevorblades.com"

	query = test.query("
		{
			continents {
				code
				name
			}
		}
	")

	describe "Queries" do
		it "return data from GQL API" do
			query["data"].size.should be > 0
		end
	end
end