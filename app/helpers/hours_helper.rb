module HoursHelper

	def hours_on_day(day)
		return "
		  <ul>
        <% m.hours_on_day(#{day}).each do |h| %>
           <li><%= h.start.strftime('%H:%M')%>-<%= h.stop.strftime('%H:%M') %></li>
        <% end %>
      </ul>
     "
   end
end
