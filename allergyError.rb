class AllergyError < StandardError
  attr_reader :object

  def intitialize(object)
    @object = object
  end
end