Alchemy::EssenceRichtext.class_eval do

  # Enable Ferret indexing.
  #
  acts_as_ferret(:fields => { :stripped_body => {:store => :yes} }, :remote => false)

  # Ensures that the current setting for do_not_index gets updated in the db.
  before_save :update_do_not_index

  # Disables the ferret indexing, if do_not_index attribute is set to true
  #
  # You can disable indexing in the elements.yml file.
  #
  # === Example
  #
  #   name: secrets
  #   contents:
  #   - name: confidential
  #     type: EssenceRichtext
  #     do_not_index: true
  #
  def ferret_enabled?(is_bulk_index = false)
    !do_not_index?
  end

  private

  def update_do_not_index
    write_attribute(:do_not_index, description['do_not_index'] || false)
    true
  end
  
end
