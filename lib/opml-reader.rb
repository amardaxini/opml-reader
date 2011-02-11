module Opml

  def parse(xml_text)
    parser = Nokogiri::XML(xml_text)
    self.head =set_header_data(parser)
    self.outlines =parse_body(parser)
    self
  end

  def parse_body(parser)
    outlines = []
    opml_outlines = parser.xpath("//body//outline")
    opml_outlines.each do |opml_outline|
      opml_body =  OpmlBody.new
      opml_outline.attributes.each do |key,value|
        opml_body.outline.merge!(key=>value.value)
      end
      outlines << opml_body
    end
    outlines
  end

  def set_elements(options={})
    {"title"=>"title","dateCreated"=>"created_date","dateModified"=>"modified_date","ownerName"=>"owner_name","ownerEmail"=>"owner_email"}
  end
  def set_header_data(parser)
    header_elements = {}
    opml_header = parser.xpath("//head")
    set_elements.each do |key,field|
      text_data = opml_header.xpath("//#{key}").text
      header_elements.merge!(field=>text_data)
    end
    header_elements
  end

  class OpmlBody
    attr_accessor :outline
    def initialize
      @outline = {}
    end
  end

  module Reader
    include Opml
    def self.included(base)
      base.extend ClassMethods
    end

    def parse_opml(xml_text)
      self.class.elements
      if File.exist?(xml_text)
        self.parse(File.read(xml_text))
      else
        self.parse(xml_text)
      end
    end
    module ClassMethods
      def elements
        attr_accessor :head,:outlines
      end
    end
  end
end

