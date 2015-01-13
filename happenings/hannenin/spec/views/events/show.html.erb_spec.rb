require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "Name",
      :runt_time => "Runt Time",
      :description => "Description",
      :venue_id => 1,
      :style => "Style",
      :price => "Price",
      :box_office_num => "Box Office Num",
      :tickets_url => "Tickets Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Runt Time/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Style/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Box Office Num/)
    expect(rendered).to match(/Tickets Url/)
  end
end
