  require 'json'
require_relative 'cohort'

class Parser
  def parse(filename)
    data = JSON.parse(File.read(filename), symbolize_names: true)
    visitors = create_visitors(data)
    seperate_into_cohorts(visitors)
  end

  private

  def create_visitors(data)
    data.map { |obj| Visitor.new(obj[:visit_date], obj[:cohort], obj[:result]) }
  end

  def seperate_into_cohorts(visitors)
    grouped = visitors.group_by(&:cohort)
    cohort_1_name = grouped.keys[0]
    cohort_2_name = grouped.keys[1]
    [
      Cohort.new(cohort_1_name, grouped[cohort_1_name]),
      Cohort.new(cohort_2_name, grouped[cohort_2_name]),
    ]
  end
end
