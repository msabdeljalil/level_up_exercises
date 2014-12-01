require 'abanalyzer'

class SplitTest
  def initialize(cohort_1, cohort_2)
    @cohort_1 = cohort_1
    @cohort_2 = cohort_2
    @ab_test = tester
  end

  # at 0.05 level of significance
  def different?
    @ab_test.different?
  end

  def chisquare_p_value
    @ab_test.chisquare_p.round(5)
  end

  private

  def tester
    ABAnalyzer::ABTest.new(values)
  end

  def values
    {
      cohort_1: {
        sample_size: @cohort_1.sample_size,
        success: @cohort_1.conversions,
      },
      cohort_2: {
        sample_size: @cohort_2.sample_size,
        success: @cohort_2.conversions,
      },
    }
  end
end
