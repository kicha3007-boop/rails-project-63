# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def to_html
        Tag.build('input', name: name, type: 'text', value: value, **attributes)
      end
    end
  end
end
