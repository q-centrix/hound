class Plan
  PRICES = {
    exempt: 0,
    public: 0,
    private: 0
  }

  TYPES = {
    exempt: "exempt",
    public: "public",
    private: "private"
  }

  def initialize(repo)
    @repo = repo
  end

  def type
    if @repo.exempt?
      TYPES[:exempt]
    else
      TYPES[:public]
    end
  end

  def price
    if @repo.exempt?
      PRICES[:exempt]
    else
      PRICES[:public]
    end
  end
end
