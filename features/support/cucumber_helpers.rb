module CucumberHelpers
  def name_to_attribute(name)
    name.underscore.gsub(/\s+/) { '_' }.to_sym
  end

  def table_to_attributes(table)
    table.hashes.map do |attr_hash|
      Hash[ attr_hash.collect{|k, v| [name_to_attribute(k), v] } ]
    end
  end
end
World CucumberHelpers
