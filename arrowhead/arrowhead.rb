class Arrowhead

  class InvalidRegionError < RuntimeError
    # Error msg Option 1: overwrite the to_s method
    def to_s
      "Unknown region, please provide a valid region."
    end
  end

  class InvalidShapeError < RuntimeError
    # Error msg Option 2: 'super' the initialize method with a string
    def initialize
      super "Unknown shape value. Are you sure you know what you're talking about?"
    end

  end

    # Error msg Option 3: Create a messages/hash that you can call 
  MESSAGE = { 
    InvalidShapeError: "Unknown shape value. Are you sure you know what you're talking about?",
    InvalidRegionError: "Unknown region, please provide a valid region."
  }

  # Refactor by taking out into seperate json file
  CLASSIFICATIONS = {
    far_west: {
      notched: "Archaic Side Notch",
      stemmed: "Archaic Stemmed",
      lanceolate: "Agate Basin",
      bifurcated: "Cody",
    },
    northern_plains: {
      notched: "Besant",
      stemmed: "Archaic Stemmed",
      lanceolate: "Humboldt Constricted Base",
      bifurcated: "Oxbow",
    },
  }

  def self.classify(target_region, target_shape)
    shapes = classify_region(target_region)
    classify_shape(shapes, target_shape).tap do |this|
      puts "You have a(n) '#{this}' arrowhead. Probably priceless."
    end
  end

  def self.classify_region(region)
    CLASSIFICATIONS.fetch(region) { raise InvalidRegionError }
  end

  def self.classify_shape(shapes, target_shape)
    shapes.fetch(target_shape) { raise VAR }
  end
end

Arrowhead.classify(:northern_plains, :bircated)
