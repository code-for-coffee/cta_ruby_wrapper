class Helpers

  def parse_xml_to_hash(xml_document)

    require 'nokogiri'

    dom = Nokogiri::XML(xml_document)

    hash = dom.root.element_children.each_with_object(Hash.new) do |e, h|
      h[e.name.to_sym] = e.content
    end

  end

end