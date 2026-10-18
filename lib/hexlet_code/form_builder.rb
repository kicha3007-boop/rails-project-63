# frozen_string_literal: true

module HexletCode
  class FormBuilder
    INPUT_TYPES = {
      input: Inputs::StringInput,
      text: Inputs::TextInput
    }.freeze

    attr_reader :form_body

    def initialize(entity, url: '#', method: 'post', **attributes)
      @entity = entity
      @form_body = {
        inputs: [],
        submit: nil,
        form_options: { action: url, method: method, **attributes }
      }
    end

    def input(name, as: :input, **attributes)
      value = @entity.public_send(name)
      input_class = INPUT_TYPES.fetch(as) { raise Error, "Unknown input type: #{as}" }
      @form_body[:inputs] << input_class.new(name, value, attributes)
    end

    def submit(value = 'Save', **attributes)
      @form_body[:submit] = { type: 'submit', value: value, **attributes }
    end
  end
end
