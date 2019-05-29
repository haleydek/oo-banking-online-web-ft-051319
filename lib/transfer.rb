class Transfer
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @receiver.valid?
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      if self.valid? == true
        @status = "complete"
      else
        return "Transaction rejected. Please check your account balance."
      end
    else
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    
  end
  
end
