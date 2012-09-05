# encoding: utf-8
require 'spec_helper'

describe 'datetime select input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe "general" do

    before do
      ::I18n.backend.store_translations :en, {}
      output_buffer.replace ''
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :datetime_select))
      end)
    end

    it_should_have_bootstrap_horizontal_wrapping
    it_should_have_input_wrapper_with_class("datetime_select")
    it_should_have_input_wrapper_with_class(:input)
    it_should_have_input_wrapper_with_id("post_publish_at_input")
    it_should_apply_error_logic_for_input_type(:datetime_select)
    
    it 'should have a legend and label with the label text inside the fieldset' do
      output_buffer.should have_tag('form div.control-group.datetime_select label.control-label', /Publish at/)
    end
    
    it 'should have five selects' do
      output_buffer.should have_tag('form div.control-group.datetime_select div.controls select', :count => 5)
    end
  end

  describe "when namespace is provided" do
  
    before do
      output_buffer.replace ''
      concat(semantic_form_for(@new_post, :namespace => "context2") do |builder|
        concat(builder.input(:publish_at, :as => :datetime_select))
      end)
    end
  
    it_should_have_input_wrapper_with_id("context2_post_publish_at_input")
    it_should_have_select_with_id("context2_post_publish_at_1i")
    it_should_have_select_with_id("context2_post_publish_at_2i")
    it_should_have_select_with_id("context2_post_publish_at_3i")
    it_should_have_select_with_id("context2_post_publish_at_4i")
    it_should_have_select_with_id("context2_post_publish_at_5i")
  
  end
  
  describe "when index is provided" do

    before do
      @output_buffer = ''
      mock_everything

      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.fields_for(:author, :index => 3) do |author|
          concat(author.input(:created_at, :as => :datetime_select))
        end)
      end)
    end
    
    it 'should index the id of the control-group' do
      output_buffer.should have_tag("div.control-group#post_author_attributes_3_created_at_input")
    end
    
    it 'should index the id of the select tag' do
      output_buffer.should have_tag("select#post_author_attributes_3_created_at_1i")
      output_buffer.should have_tag("select#post_author_attributes_3_created_at_2i")
      output_buffer.should have_tag("select#post_author_attributes_3_created_at_3i")
      output_buffer.should have_tag("select#post_author_attributes_3_created_at_4i")
      output_buffer.should have_tag("select#post_author_attributes_3_created_at_5i")
    end
    
    it 'should index the name of the select tag' do
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(1i)]']")
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(2i)]']")
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(3i)]']")
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(4i)]']")
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(5i)]']")
    end
    
  end
  
  
  describe ':labels option' do
    describe ':labels option' do
      it "should provide a message that :labels is not supported" do
        pending ':labels is not supported'
      end
    end

  end
  
  describe "when required" do
    it "should add the required attribute to the input's html options" do
      with_config :use_required_attribute, true do 
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:title, :as => :datetime_select, :required => true))
        end)
        output_buffer.should have_tag("select[@required]", :count => 5)
      end
    end
  end
  
end
