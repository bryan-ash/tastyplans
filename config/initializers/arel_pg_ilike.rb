require 'arel'

module Arel
  module Predicates
    class Match < Binary
      def predicate_sql
        'ILIKE'
      end
    end
  end
end
