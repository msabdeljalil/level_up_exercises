require 'abanalyzer'

class Cohort
  CONFIDENCE_LEVEL = 0.95
  attr_reader :name, :visitors

  def initialize(name, visitors = [])
    @name = name
    @visitors = visitors
  end

  def sample_size
    @visitors.length
  end

  def add(visitors)
    @visitors += [visitors]
    self
  end

  def conversions
    @visitors.count(&:conversion?)
  end

  def conversion_percentage
    return 0 unless sample_size > 0
    conversions.to_f / sample_size.to_f
  end

  def confidence_interval
    raise ArgumentError, "Sample size must be > 0" unless sample_size > 0
    ABAnalyzer.confidence_interval(conversions, sample_size, CONFIDENCE_LEVEL)
  end
end

Visitor = Struct.new(:visit_date, :cohort, :result) do
  def conversion?
    result == 1
  end
end
