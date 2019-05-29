class Transfer
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  transaction_counter = 0
  
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
    transaction_counter += 1
    until transaction_counter > 1
      if @sender.valid?
        @receiver.deposit(@amount)
        @sender.balance -= @amount
        if self.valid? == true
          @status = "complete"
        else
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
  end
  
  def reverse_transfer
    
  end
  
end
