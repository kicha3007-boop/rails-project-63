# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_reader :name, :value, :attributes

      def initialize(name, value, attributes = {})
        @name = name
        @value = value
        @attributes = attributes
      end

      def label
        Tag.build('label', for: name) { name.to_s.capitalize }
      end

      def to_html
        raise NotImplementedError
      end
    end
  end
end
