require 'dry/monads/result'

module Dry
  module Monads
    module RightBiased
      module Right
        def success
          @value
        end

        def failure
          nil
        end
      end

      module Left
        def success
          nil
        end

        def failure
          nil
        end
      end
    end
  end
end

M = Dry::Monads
