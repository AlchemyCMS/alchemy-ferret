Alchemy::Content.class_eval do

  # Prepares the attributes for creating the essence.
  #
  # 1. It sets a default text if given in +elements.yml+
  # 2. It sets do_not_index value for EssenceText and EssenceRichtext essences
  #
  def prepared_attributes_for_essence
    attributes = {
      ingredient: default_text(description['default'])
    }
    if description['type'] == "EssenceRichtext" || description['type'] == "EssenceText"
      attributes.merge!(do_not_index: !!description['do_not_index'])
    end
    attributes
  end

end
