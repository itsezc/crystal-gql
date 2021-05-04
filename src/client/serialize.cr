require "json"

module GQL 
	module Serializable
		annotation Options
		end

		macro included
			
			def self.new(pull : ::JSON::PullParser)
				init_from_json(pull)
			end

			private def self.init_from_json(pull : ::JSON::PullParser)
				instance = allocate
				instance.initialize(__pull_for_json_serializable: pull)
				GC.add_finalizer(instance) if instance.responds_to?(:finalize)
				instance
			end

			macro inherited
				def self.new(pull : ::JSON::PullParser)
					init_from_json(pull)
				end
			end

			def self.graphql
				instance = allocate
				instance.graphql
			end
			
		end
	end
end