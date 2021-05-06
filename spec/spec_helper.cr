require "spec"
require "json"
require "../src/client/client"

class GQLClient < GraphQLClient
      def ret_add_headers
            @additional_headers
      end
end