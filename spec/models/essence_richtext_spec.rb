require 'spec_helper'

module Alchemy
  describe EssenceRichtext do

    context "with `do_not_index` set to true" do
      it "should disable ferret indexing" do
        EssenceRichtext.any_instance.stub(:description).and_return({'do_not_index' => true})
        essence = EssenceRichtext.create
        essence.ferret_enabled?.should be_false
      end
    end

    context "with `do_not_index` set to false" do
      it "should enable ferret indexing" do
        EssenceRichtext.any_instance.stub(:description).and_return({'do_not_index' => false})
        essence = EssenceRichtext.create
        essence.ferret_enabled?.should be_true
      end
    end

  end
end
