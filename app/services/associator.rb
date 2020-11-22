class Associator
  def self.run
    SchemaType.all.each { |st| st.associate }
  end
end
