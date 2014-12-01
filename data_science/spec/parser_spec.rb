require_relative 'spec_helper'
require_relative '../lib/parser'

describe Parser do

  context "with a proper file with 2 cohorts" do
    subject(:parsed_file) { Parser.new.parse("./source_data.json") }

    it "returns 2 cohorts" do
      # TODO: Should this have 3 expects? Break it out? Remove some?
      expect(parsed_file).to respond_to(:each)
      expect(parsed_file.length).to be(2)
      expect(parsed_file[0]).to be_a(Cohort)
      expect(parsed_file[1]).to be_a(Cohort)
    end

    it "first cohort has 10 visitors" do
      # Mock things go here
      expect(parsed_file[0].visitors.length).to be(1543)
    end

    it "second cohort has 10 visitors" do
      expect(parsed_file[1].visitors.length).to be(1349)
    end
  end

  # context "when a source file contains more than 2 cohorts"
  #   subject(:parsed_file) { parser.parse("./data_with_4_cohorts.json") }

  #   it "returns an enumberable containing cohorts" do
  #     # TODO: Should this have 3 expects? Break it out? Remove some?
  #     expect(parsed_file).to respond_to(:each)
  #     expect(parsed_file[0]).to be_a(Cohort)
  #     expect(parsed_file[1]).to be_a(Cohort)
  #   end
  # end

end
# rspec group matchers?
# research MOCK's

# check cohort.name 
# check size of cohort a and b's data
# test/fixtures

# size, name, returns 2
# what if 1 cohort