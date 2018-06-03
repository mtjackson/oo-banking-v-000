class Transfer
#  attr_reader :transfer_id
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  #  @transfer_id = rand(1..n)
  end

  def valid?
    if @sender.valid? == true  && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && @sender.balance > @amount && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status = "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
