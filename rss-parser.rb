# coding: utf-8
require 'open-uri'
require 'rexml/document'
require 'date'

url = 'http://blog.livedoor.jp/dqnplus/index.rdf'

doc = REXML::Document.new(open(url))
doc.elements.each('rdf:RDF/item') do |item|
  dc_date = Date.parse(item.elements['dc:date'].text)

  if (Date.today - dc_date).to_i <= 7
    puts item.elements['link'].text
  end
end
