# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tag_build
    assert { HexletCode::Tag.build('br') == '<br>' }
    assert { HexletCode::Tag.build('img', src: 'path/to/image') == '<img src="path/to/image">' }
    assert { HexletCode::Tag.build('input', type: 'submit', value: 'Save') == '<input type="submit" value="Save">' }
    assert { HexletCode::Tag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>' }
    assert { HexletCode::Tag.build('div') == '<div></div>' }
  end

  def test_empty_form
    assert { HexletCode.form_for(@user) { |_f| nil } == '<form action="#" method="post"></form>' }
  end

  def test_form_with_attributes
    html = HexletCode.form_for(@user, url: '/profile', class: 'hexlet-form') { |_f| nil }

    assert { html == '<form action="/profile" method="post" class="hexlet-form"></form>' }
  end

  def test_form_with_inputs
    html = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert { html == load_fixture('form_with_inputs.html') }
  end

  def test_form_with_input_attributes
    html = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert { html == load_fixture('form_with_input_attributes.html') }
  end

  def test_form_with_submit
    html = HexletCode.form_for User.new(job: 'hexlet') do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert { html == load_fixture('form_with_submit.html') }
  end

  def test_form_with_custom_submit
    html = HexletCode.form_for User.new(job: 'hexlet'), url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert { html == load_fixture('form_with_custom_submit.html') }
  end

  def test_unknown_field_raises_error
    assert_raises(NoMethodError) do
      HexletCode.form_for(@user) { |f| f.input :age }
    end
  end
end
