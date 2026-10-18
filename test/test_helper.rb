# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest-power_assert'

def load_fixture(name)
  File.read(File.join(__dir__, 'fixtures', name)).gsub(/>\s+</, '><').strip
end
