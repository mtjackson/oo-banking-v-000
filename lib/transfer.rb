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
    if self.valid? == true && @sender.balance > @amount
      i = 0
      while i == 0
        @sender.balance -= @amount
        @receiver.balance += @amount
        #  self.amount = 0
        i += 1
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer#(sender, receiver, amount)
    if self.status = "complete"
  #    @amount = amount
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
  #    @amount = 0
    end
  end
end
