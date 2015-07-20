module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end


  class Calendar < Struct.new(:view, :date, :callback)
    HEADER = %w[Sun Mon Tue Wed Thur Fri Sat]
    START_DAY = :sunday
  
    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendar_grid" do |variable|
        header + week_rows
      end
    end

    def header
      content_tag :tr, class: "month_header row_fluid" do
        HEADER.map { |day| content_tag :th, class: "span1" do
        day
        end }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr, class: 'row-fluid week' do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = ["span1"]
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes << "month" if day.month == date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
  end
  
  def event_style(event)
    "background-color: #{event.color}:"
  end
  
  def event_link_style(event)
    if %w(white silver yellow lime aqua teal fuchsia).include?(event.color)
      "color: black;"
    else
      "color: white;"
    end
  end
end
