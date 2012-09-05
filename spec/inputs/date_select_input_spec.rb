# encoding: utf-8
require 'spec_helper'

describe 'date select input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  describe "general" do

    before do
      output_buffer.replace ''
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :date_select, :order => [:year, :month, :day]))
      end)
    end

    it_should_have_bootstrap_horizontal_wrapping
    it_should_have_input_wrapper_with_class("date_select")
    it_should_have_input_wrapper_with_class(:input)
    it_should_have_input_wrapper_with_id("post_publish_at_input")
    it_should_apply_error_logic_for_input_type(:date_select)

    it 'should have a label with the label text inside the control-group' do
      output_buffer.should have_tag('form div.control-group > label.control-label', /Publish at/)
      output_buffer.should have_tag('form div.control-group label.control-label[@for="post_publish_at"]')
    end

    it 'should not associate the legend label with the first select' do
      output_buffer.should_not have_tag('form div.control-group label.control-label[@for="post_publish_at_1i"]')
    end

    it 'should not have three labels for year, month and day' do
      output_buffer.should_not have_tag('form div.control-group div.controls label', :count => 3)
      output_buffer.should_not have_tag('form div.control-group div.controls label', /year/i)
      output_buffer.should_not have_tag('form div.control-group div.controls label', /month/i)
      output_buffer.should_not have_tag('form div.control-group div.controls label', /day/i)
    end

    it 'should have three selects for year, month and day' do
      output_buffer.should have_tag('form div.control-group div.controls select', :count => 3)
    end
  end

  describe "when namespace is provided" do

    before do
      output_buffer.replace ''
      concat(semantic_form_for(@new_post, :namespace => "context2") do |builder|
        concat(builder.input(:publish_at, :as => :date_select, :order => [:year, :month, :day]))
      end)
    end

    it_should_have_input_wrapper_with_id("context2_post_publish_at_input")
    it_should_have_select_with_id("context2_post_publish_at_1i")
    it_should_have_select_with_id("context2_post_publish_at_2i")
    it_should_have_select_with_id("context2_post_publish_at_3i")

  end
  
  describe "when index is provided" do

    before do
      @output_buffer = ''
      mock_everything

      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.fields_for(:author, :index => 3) do |author|
          concat(author.input(:created_at, :as => :date_select))
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
    end
    
    it 'should index the name of the select tag' do
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(1i)]']")
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(2i)]']")
      output_buffer.should have_tag("select[@name='post[author_attributes][3][created_at(3i)]']")
    end
    
  end

  describe ':labels option' do
    it "should provide a message that :labels is not supported" do
      pending ':labels is not supported'
    end
  end
  
  describe "when required" do
    it "should add the required attribute to the input's html options" do
      with_config :use_required_attribute, true do 
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:title, :as => :date_select, :required => true))
        end)
        output_buffer.should have_tag("select[@required]", :count => 3)
      end
    end
  end
  
  describe "when order does not include day" do
    before do
      output_buffer.replace ''
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :date_select, :order => [:year, :month]))
      end)
    end

    it "should include a hidden input for day" do
      output_buffer.should have_tag('input[@type="hidden"][@name="post[publish_at(3i)]"][@value="1"]')
    end

    it "should not include a select for day" do
      output_buffer.should_not have_tag('select[@name="post[publish_at(3i)]"]')
    end
  end

  describe "when order does not include month" do
    before do
      output_buffer.replace ''
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :date_select, :order => [:year, :day]))
      end)
    end

    it "should include a hidden input for month" do
      output_buffer.should have_tag('input[@type="hidden"][@name="post[publish_at(2i)]"][@value="1"]')
    end

    it "should not include a select for month" do
      output_buffer.should_not have_tag('select[@name="post[publish_at(2i)]"]')
    end
  end

  describe "when order does not include year" do
    before do
      output_buffer.replace ''
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:publish_at, :as => :date_select, :order => [:month, :day]))
      end)
    end

    it "should include a hidden input for month" do
      output_buffer.should have_tag("input[@type=\"hidden\"][@name=\"post[publish_at(1i)]\"][@value=\"#{Time.now.year}\"]")
    end

    it "should not include a select for month" do
      output_buffer.should_not have_tag('select[@name="post[publish_at(1i)]"]')
    end
  end

end
