# frozen_string_literal: true

module BaseTypes
  module Nullable
    def self.included(base)
      %i[not_nullable non_nullable nullable].each do |method_name|
        next unless base.respond_to?(method_name)

        raise "Method #{method_name} already defined"
      end

      base.extend(ClassMethods)
    end

    module ClassMethods
      def inherited(base)
        base.extend(BaseTypes::Nullable::ClassMethods)
        super
      end

      def included(base)
        base.extend(BaseTypes::Nullable::ClassMethods)
        super
      end

      private

      def not_nullable(**options, &block)
        with_options(options.reverse_merge(null: false), &block)
      end

      def non_nullable(**options, &block)
        with_options(options.reverse_merge(null: false), &block)
      end

      def nullable(**options, &block)
        with_options(options.reverse_merge(null: true), &block)
      end
    end
  end
end
