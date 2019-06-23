module BaseTypes
  module Requirable
    def self.included(base)
      raise "Method 'required' already defined" if base.respond_to?(:required)
      raise "Method 'optional' already defined" if base.respond_to?(:optional)

      base.extend(ClassMethods)
    end

    module ClassMethods
      def inherited(base)
        base.extend(BaseTypes::Requirable::ClassMethods)
        super
      end

      def included(base)
        base.extend(BaseTypes::Requirable::ClassMethods)
        super
      end

      private

      def required(**options, &block)
        with_options(options.reverse_merge(required: true), &block)
      end

      def optional(**options, &block)
        with_options(options.reverse_merge(required: false), &block)
      end
    end
  end
end
