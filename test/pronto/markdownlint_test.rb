require "test_helper"

class Pronto::MarkdownlintTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Pronto::Markdownlint::VERSION
  end
end
