require 'spec_helper'

module Alchemy
  describe Content do
    let(:essence_class) { EssenceText }
    let(:content) { Content.new }

    before { content.stub(:essence_class).and_return(essence_class) }

    describe "create a EssenceText" do
      context 'with do_not_index set to true' do
        before { content.stub(:description).and_return({'type' => 'EssenceText', 'do_not_index' => true}) }

        it "sets the do_not_index attribute to true" do
          essence_class.should_receive(:create!).with(
            ingredient: nil,
            do_not_index: true
          )
          content.create_essence!
        end
      end

      context 'with do_not_index set to false' do
        before { content.stub(:description).and_return({'type' => 'EssenceText', 'do_not_index' => false}) }

        it "sets the do_not_index attribute to true" do
          essence_class.should_receive(:create!).with(
            ingredient: nil,
            do_not_index: false
          )
          content.create_essence!
        end
      end

      context 'with do_not_index set to nil' do
        before { content.stub(:description).and_return({'type' => 'EssenceText', 'do_not_index' => nil}) }

        it "sets the do_not_index attribute to true" do
          essence_class.should_receive(:create!).with(
            ingredient: nil,
            do_not_index: false
          )
          content.create_essence!
        end
      end
    end

    describe "create a EssenceRichtext" do
      context 'with do_not_index set to true' do
        before { content.stub(:description).and_return({'type' => 'EssenceRichtext', 'do_not_index' => true}) }

        it "sets the do_not_index attribute to true" do
          essence_class.should_receive(:create!).with(
            ingredient: nil,
            do_not_index: true
          )
          content.create_essence!
        end
      end

      context 'with do_not_index set to false' do
        before { content.stub(:description).and_return({'type' => 'EssenceRichtext', 'do_not_index' => false}) }

        it "sets the do_not_index attribute to true" do
          essence_class.should_receive(:create!).with(
            ingredient: nil,
            do_not_index: false
          )
          content.create_essence!
        end
      end

      context 'with do_not_index set to nil' do
        before { content.stub(:description).and_return({'type' => 'EssenceRichtext', 'do_not_index' => nil}) }

        it "sets the do_not_index attribute to true" do
          essence_class.should_receive(:create!).with(
            ingredient: nil,
            do_not_index: false
          )
          content.create_essence!
        end
      end
    end
  end
end
