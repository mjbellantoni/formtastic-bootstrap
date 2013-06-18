# encoding: utf-8
require 'spec_helper'

describe 'actions' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
  end

  after do
    ::I18n.backend.reload!
  end

  describe "data-disable-with text" do

    { :button => { :action => :submit, :method => :create },
      :link => { :action => :cancel, :method => :cancel },
      :input => { :action => :submit, :method => :create } }.each do |type, options|
      describe "for #{type} inputs" do

        describe "when found in i18n" do
          it "should have a data-disable-with containing i18n text" do
            with_config :i18n_lookups_by_default, true do
              ::I18n.backend.store_translations :en, :formtastic => { :action_disablers => { :post => { options[:method] => 'War and Peace' }}}
              concat(semantic_form_for(@new_post) do |builder|
                concat(builder.action(options[:action], :as => type))
              end)
              output_buffer.should have_tag((type == :link ? 'a' : type.to_s) + '[@data-disable-with="War and Peace"]')
            end
          end
        end

        describe "when not found in i18n" do
          it "should not have data-disable-with" do
            concat(semantic_form_for(@new_post) do |builder|
              concat(builder.action(options[:action], :as => type))
            end)
            output_buffer.should_not have_tag((type == :link ? 'a' : type.to_s) + '[@data-disable-with]')
          end
        end

        describe "when found in i18n and :button_html" do
          it "should favor :button_html" do
            with_config :i18n_lookups_by_default, true do
              ::I18n.backend.store_translations :en, :formtastic => { :action_disablers => { :post => { options[:method] => 'War and Peace' }}}
              concat(semantic_form_for(@new_post) do |builder|
                concat(builder.action(options[:action], :as => type, :button_html => { 'data-disable-with' => "Foo" }))
              end)
              output_buffer.should have_tag((type == :link ? 'a' : type.to_s) + '[@data-disable-with="Foo"]')
            end
          end
        end

        describe "when found in :button_html" do
          it "should use the :button_html data-disable-with" do
            concat(semantic_form_for(@new_post) do |builder|
              concat(builder.action(options[:action], :as => type, :button_html => { 'data-disable-with' => "Untitled" }))
            end)
            output_buffer.should have_tag((type == :link ? 'a' : type.to_s) + '[@data-disable-with="Untitled"]')
          end
        end

      end

    end

  end

end
