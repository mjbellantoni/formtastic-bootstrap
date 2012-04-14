# encoding: utf-8
require 'spec_helper'

describe 'radio input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
    Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder
  end

  describe 'for belongs_to association' do
    before do
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:author, :as => :radio, :value_as_class => true, :required => true))
      end)
    end

    it_should_have_input_wrapper_with_class("radio")
    it_should_have_input_wrapper_with_class("control-group")
    it_should_have_input_class_in_the_right_place
    it_should_have_input_wrapper_with_id("post_author_input")
    it_should_have_a_nested_div
    it_should_have_a_nested_div_with_class('choices.controls')
    #it_should_have_a_nested_unordered_list_with_class('choices-group.inputs-list')
    it_should_apply_error_logic_for_input_type(:radio, :block)
    it_should_use_the_collection_when_provided(:radio, 'input[@type="radio"]')

    it 'should generate a \'legend\' containing a label with text for the input' do
      output_buffer.should have_tag('form div.control-group label.control-label')
      output_buffer.should have_tag('form div.control-group label.control-label', /Author/)
    end

    it 'should not link the \'legend\' label to any input' do
      output_buffer.should_not have_tag('form div.control-group > label.control-label[@for]')
    end

    # it 'should generate an unordered list with a list item for each choice' do
    #   output_buffer.should have_tag('form div.control-group div.controls ul')
    #   output_buffer.should have_tag('form div.control-group div.controls ul li.choice', :count => ::Author.all.size)
    # end

    it 'should have one option with a "checked" attribute' do
      output_buffer.should have_tag('form .controls input[@checked]', :count => 1)
    end

    describe "each choice" do

      it 'should not give the choice label the .control-label class' do
        output_buffer.should_not have_tag('div.controls label.control-label')
      end

      it 'should not add the required attribute to each input' do
        output_buffer.should_not have_tag('li.choice input[@required]')
      end


      it 'should contain a label for the radio input with a nested input and label text' do
        ::Author.all.each do |author|
          output_buffer.should have_tag('form div.control-group div.controls label.radio', /#{author.to_label}/)
          output_buffer.should have_tag("form div.control-group div.controls label.radio[@for='post_author_id_#{author.id}']")
        end
      end

      it 'should use values as li.class when value_as_class is true' do
        ::Author.all.each do |author|
          output_buffer.should have_tag("form div.control-group label.radio.author_#{author.id}")
        end
      end

      it "should have a radio input" do
        ::Author.all.each do |author|
          output_buffer.should have_tag("form div.control-group div.controls label.radio input#post_author_id_#{author.id}")
          output_buffer.should have_tag("form div.control-group div.controls label.radio input[@type='radio']")
          output_buffer.should have_tag("form div.control-group div.controls label.radio input[@value='#{author.id}']")
          output_buffer.should have_tag("form div.control-group div.controls label.radio input[@name='post[author_id]']")
        end
      end

      it "should mark input as checked if it's the the existing choice" do
        @new_post.author_id.should == @bob.id
        @new_post.author.id.should == @bob.id
        @new_post.author.should == @bob

        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:author, :as => :radio))
        end)

        output_buffer.should have_tag("form div.control-group div.controls label.radio input[@checked='checked']")
      end

      it "should mark the input as disabled if options attached for disabling" do
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:author, :as => :radio, :collection => [["Test", 'test'], ["Try", "try", {:disabled => true}]]))
        end)

        output_buffer.should_not have_tag("form div.control-group div.controls label.radio input[@value='test'][@disabled='disabled']")
        output_buffer.should have_tag("form div.control-group div.controls label.radio input[@value='try'][@disabled='disabled']")
      end

      it "should not contain invalid HTML attributes" do

        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:author, :as => :radio))
        end)

        output_buffer.should_not have_tag("form div.control-group div.controls input[@find_options]")
      end

    end

    describe 'and no object is given' do
      before(:each) do
        output_buffer.replace ''
        concat(semantic_form_for(:project, :url => 'http://test.host') do |builder|
          concat(builder.input(:author_id, :as => :radio, :collection => ::Author.all))
        end)
      end

      it 'should generate a div with a label' do
        output_buffer.should have_tag('form div.control-group label.control-label', /Author/)
      end

      it 'should generate an li tag for each item in the collection' do
        output_buffer.should have_tag('form div.control-group div label.radio', :count => ::Author.all.size)
      end

      it 'should generate labels for each item' do
        ::Author.all.each do |author|
          output_buffer.should have_tag('form div div label.radio', /#{author.to_label}/)
          output_buffer.should have_tag("form div div label.radio[@for='project_author_id_#{author.id}']")
        end
      end

      it 'should html escape the label string' do
        concat(semantic_form_for(:project, :url => 'http://test.host') do |builder|
          concat(builder.input(:author_id, :as => :radio, :collection => [["<b>Item 1</b>", 1], ["<b>Item 2</b>", 2]]))
        end)
        output_buffer.should have_tag('form div div label.radio') do |label|
          # label.body.should match /&lt;b&gt;Item [12]&lt;\/b&gt;$/
          label.body.should match /&lt;b&gt;Item [12]&lt;\/b&gt;/
        end
      end

      it 'should generate inputs for each item' do
        ::Author.all.each do |author|
          output_buffer.should have_tag("form div div label.radio input#project_author_id_#{author.id}")
          output_buffer.should have_tag("form div div label.radio input[@type='radio']")
          output_buffer.should have_tag("form div div label.radio input[@value='#{author.id}']")
          output_buffer.should have_tag("form div div label.radio input[@name='project[author_id]']")
        end
      end
    end
  end

  describe "with i18n of the legend label" do

    before do
      ::I18n.backend.store_translations :en, :formtastic => { :labels => { :post => { :authors => "Translated!" }}}

      with_config :i18n_lookups_by_default, true do
        @new_post.stub!(:author_ids).and_return(nil)
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:authors, :as => :radio))
        end)
      end
    end

    after do
      ::I18n.backend.reload!
    end

    it "should do foo" do
      output_buffer.should have_tag("div.control-group > label.control-label", /Translated/)
    end

  end

  describe "when :label option is set" do
    before do
      @new_post.stub!(:author_ids).and_return(nil)
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:authors, :as => :radio, :label => 'The authors'))
      end)
    end

    it "should output the correct label title" do
      output_buffer.should have_tag("div.control-group > label.control-label", /The authors/)
    end
  end

  describe "when :label option is false" do
    before do
      @output_buffer = ''
      @new_post.stub!(:author_ids).and_return(nil)
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:authors, :as => :radio, :label => false))
      end)
    end

    it "should not output the legend" do
      output_buffer.should_not have_tag("legend.control-label")
      output_buffer.should_not include("&gt;")
    end

    it "should not cause escaped HTML" do
      output_buffer.should_not include("&gt;")
    end
  end

  describe "when :required option is true" do
    before do
      @new_post.stub!(:author_ids).and_return(nil)
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:authors, :as => :radio, :required => true))
      end)
    end

    it "should output the correct label title" do
      output_buffer.should have_tag("div.control-group label.control-label abbr")
    end
  end

  describe "when :namespace is given on form" do
    before do
      @output_buffer = ''
      @new_post.stub!(:author_ids).and_return(nil)
      concat(semantic_form_for(@new_post, :namespace => "custom_prefix") do |builder|
        concat(builder.input(:authors, :as => :radio, :label => ''))
      end)

      output_buffer.should match(/for="custom_prefix_post_author_ids_(\d+)"/)
      output_buffer.should match(/id="custom_prefix_post_author_ids_(\d+)"/)
    end
    it_should_have_input_wrapper_with_id("custom_prefix_post_authors_input")
  end

end
