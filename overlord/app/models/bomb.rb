class Bomb
  attr_reader :activation_code, :deactivation_code, :timer, :fuse
  attr_accessor :status, :deactivation_attempts, :messages

  ACTIVE = "ACTIVE"
  INACTIVE = "Inactive"

  DEFAULT_ACTIVATE = "1234"
  DEFAULT_DEACTIVATE = "1234"
  DEFAULT_FUSE = 7

  def initialize(args)
    @activation_code = activation_check(args[:create_activation_code])
    @deactivation_code = deactivation_check(args[:create_deactivation_code])
    @fuse = fuse_check(args[:fuse])
    @status = INACTIVE
    @deactivation_attempts = 0
  end

  def activate(input_code)
    return false unless input_code == activation_code
    @status = ACTIVE
    @messages = nil
    start_timer
  end

  def deactivate(input_code)
    if input_code == @deactivation_code
      @status = INACTIVE
      reset_timer
    else
      @deactivation_attempts += 1
    end
  end

  def active?
    @status == ACTIVE
  end

  def exploded?
    too_many_deactivation_attempts? || timer_ended?
  end

  private

  def start_timer
    @timer = Time.now
  end

  def reset_timer
    @timer = nil
  end

  def timer_ended?
    timer && (Time.now >= timer + fuse)
  end

  def too_many_deactivation_attempts?
    deactivation_attempts >= 3
  end

  def activation_check(args)
    args.empty? ? DEFAULT_ACTIVATE : args.to_s
  end

  def deactivation_check(args)
    args.empty? ? DEFAULT_DEACTIVATE : args.to_s
  end

  def fuse_check(args)
    args.empty? ? DEFAULT_FUSE : args.to_i
  end
end
