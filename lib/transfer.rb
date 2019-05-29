class Transfer
  attr_accessor :sender, :receiver, :amount, :transaction_counter
  attr_reader :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transaction_counter = 0
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    until @transaction_counter == 1
      @transaction_counter += 1
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
  end
  
  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
  
end
