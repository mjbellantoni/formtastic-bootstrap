$stderr.puts "THIS A"
module FormtasticBootstrap
  $stderr.puts "THIS B"
  module Inputs
    $stderr.puts "THIS C"

    class DateSelectInput < Formtastic::Inputs::DateSelectInput
      $stderr.puts "THIS D"
      include Base
      $stderr.puts "THIS E"
      include Base::Timeish
      $stderr.puts "THIS F"
      
      # We don't want hour and minute fragments on a date input
      # def time_fragments
      #   []
      # end
      # 
      # def hidden_date_fragments
      #   default_date_fragments - date_fragments
      # end
      # 
      # def hidden_fragments
      #   hidden_date_fragments.map do |fragment|
      #     template.hidden_field_tag(hidden_field_name(fragment), fragment_value(fragment), :id => fragment_id(fragment), :disabled => input_html_options[:disabled] )
      #   end.join.html_safe
      # end
      # 
      # def fragment_value(fragment)
      #   if fragment == :year
      #     Time.now.year
      #   else
      #     '1'
      #   end
      # end      
    end
  end
end