# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/parser'

class ParserTest < Minitest::Test
  describe Parser do
    describe '#all_page_views' do
      it 'returns an array' do
        parser = Parser.new(@file)
        assert_kind_of Array, parser.all_page_views
      end
    end
    describe '#unique_page_views' do
      it 'returns an array' do
        parser = Parser.new(@file)
        assert_kind_of Array, parser.unique_page_views
      end
    end
  end
end
