class Braintree
  def initialize(username, password)
    @username = username
    @password = password
  end

  def sale(amount, cc)
    puts "This is an API call to #{self.class}"
  end
end

class Stripe
  def initialize(api_key)
    @api_key = api_key
  end

  def purchase(credit_card, customer, id)
    puts "This is an API call to #{self.class}"
  end
end

class Payment
  def initialize
    @braintree = Braintree.new('username', 'password')
    @stripe = Stripe.new('dskjfhkjsdfh')
  end

  def pay(amount, cc, type: :braintree)
    case type
    when :braintree
      @braintree.sale(amount, cc)
    when :stripe
      @stripe.purchase(cc, 'customer', 'id')
    end
  end
end
