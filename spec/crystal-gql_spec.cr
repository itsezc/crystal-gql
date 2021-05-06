require "./spec_helper"

describe GraphQLClient do
      subject = GQLClient.new "https://countries.trevorblades.com"

      describe "#add_header" do
            it "adds a key-value pair to additional headers" do
                  subject.add_header("abc", "xyz")
                  subject.ret_add_headers[0][1].should be "xyz"
            end
      end

      describe "Queries" do
		it "returns continents from GQL API" do
			data, error, loading = subject.query("
				{
					continents {
						code
						name
					}
				}
			")

			data.size.should be > 0
		end

            it "returns country data from GQL API" do
			data, error, loading = subject.query("
				{
					country(code: \"ARD\") {
                                    name
                                    capital
                                    currency
                              }
				}
			")

			data["country"].as_s?.should be_nil
		end

		it "returns newQuery" do
			data, error, loading = subject.useQuery(GQL {
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
