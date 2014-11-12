#  Should I make a single method that asks the user for all their input?
# That way, the only resonsbility of filter emthods is to retrieve data.
# However, that breaks Closed to Mode / Open to expansion principle cuz
# you'd have to edit this method to change filters rather than just sticking on
# another method 

# It seems extra difficult here cuz I'm dealing with user interaction on the command line 
require 'csv'
require 'json'
require 'table_print'
require './Dinosaur'
require './csv_converters.rb'

class Catalog
  include CsvConverters
  attr_reader :dinosaurs

  def initialize(*csv_list)
    @dinosaurs = []

    csv_list.each do |csv|
      parse_csv(csv)
    end
  end

  def bipeds
    tp @dinosaurs.uniq, :name, :walking
    answer = ask_user(%w(B Q A), "B)iped or Q)uadruped or A)ll?")

    if answer == 'B'
      filter('walking', 'Biped')
    elsif answer == 'Q'
      filter('walking', 'Quadruped')
    end

    self
  end

  def carnivores
    tp @dinosaurs, :name, :carnivore
    answer = ask_user(%w(C N A), "C)arnivore, N)not carnivore, or A)ll")

    if answer == 'C'
      filter('carnivore', 'Yes')
    elsif answer == 'N'
      filter('carnivore', 'No')
    end

    self
  end

  def periods
    tp @dinosaurs.uniq, :name, :period
    answer = ask_user(
      @dinosaurs.map { |dino| dino.period.capitalize } << 'A',
      "What time period? or A)ll",
    )

    if answer == 'A'
      return self
    else 
      filter('period', answer)
    end

    self
  end

  def size
    tp @dinosaurs, :name, :weight
    answer = ask_user(%w(G L A), "G)reater or L)ess than 2 tons? or A)ll")

    if answer == 'G'
      filter('greater_than_2tons', true)
    elsif answer == 'L'
      filter('greater_than_2tons', false)
    end
    self
  end

  def output
    if @dinosaurs.empty? 
      puts('No dinosaurs fit your criteria.') 
    else
      tp(dinosaurs)
    end
  end

  def to_json
    @dinosaurs.map(&:to_json)
  end

  private

  def ask_user(attrs, prompt)
    input = ''
    until attrs.include? input
      puts prompt
      input = STDIN.gets.chomp.capitalize
    end
    input
  end

  def filter(attrib, value)
    @dinosaurs.select! do |dino|
      # puts dino['attrib'] # TODO: Get this to work
      dino.instance_variable_get("@#{attrib.capitalize}") == value
    end
  end

  def parse_csv(csv)
    csv = CSV.new(File.open(csv),
      headers: true,
      header_converters: [:conv_genus, :conv_weight, :symbol],
      converters: [:integer],
    )
    load_dinos(csv.to_a.map(&:to_hash))
  end

  def load_dinos(dino_hash)
    dino_hash.map! { |dino| @dinosaurs << Dinosaur.new(dino) }
  end
end

if __FILE__ == $PROGRAM_NAME
  dino_catalog = Catalog.new(ARGV[0], ARGV[1])
  dino_catalog.bipeds.carnivores.periods.size.output
end
