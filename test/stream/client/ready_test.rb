# encoding: UTF-8

require 'test_helper'

class ClientReadyTest < MiniTest::Unit::TestCase
  STANZAS = []

  def setup
    @stream = MiniTest::Mock.new
    @state = Vines::Stream::Client::Ready.new(@stream, nil)
    def @state.to_stanza(node)
      if node.name == 'bogus'
        nil
      else
        stanza = MiniTest::Mock.new
        stanza.expect(:process, nil)
        stanza.expect(:validate_to, nil)
        stanza.expect(:validate_from, nil)
        ClientReadyTest::STANZAS << stanza
        stanza
      end
    end
  end

  def teardown
    STANZAS.clear
  end

  def test_good_node_processes
    node = node('<message/>')
    @state.node(node)
    assert_equal 1, STANZAS.size
    assert STANZAS.map {|s| s.verify }.all?
  end

  def test_unsupported_stanza_type
    node = node('<bogus/>')
    assert_raises(Vines::StreamErrors::UnsupportedStanzaType) { @state.node(node) }
    assert STANZAS.empty?
  end

  private

  def node(xml)
    Nokogiri::XML(xml).root
  end
end
